# Dart Runtime for AWS Lambda

![Main](https://github.com/awslabs/aws-lambda-dart-runtime/workflows/Main/badge.svg?branch=master)
[![License Apache 2](https://img.shields.io/badge/License-Apache2-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

The package makes it easy to write AWS Lambda functions in the Dart programming language.

> If you want to learn more about the project you can read the [introduction](https://aws.amazon.com/de/blogs/opensource/introducing-a-dart-runtime-for-aws-lambda/).

> If you need to access AWS APIs in your Lambda function, [please search on pub.dev](https://pub.dev/packages?q=dependency%3Ashared_aws_api&sort=popularity) provided by [Agilord](https://www.agilord.com/)

## Features

- Great performance `< 10ms` on event processing and `< 50MB` memory consumption
- No need to ship the Dart runtime
- Multiple event handlers
- Typed events
- Custom events

> this package requires Dart `>= 2.6`
> currently `dart2native` only supports building for the platform it is run on, so you must either build on a `Linux` machine or use `docker`

## Introduction

[Dart](https://dart.dev/) is a unsupported [AWS Lambda](https://aws.amazon.com/lambda/) runtime language. However, with a [custom runtime](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-custom.html) you can support virtually every programming language.

There are two ways in which you could use [Dart](https://dart.dev/). You could bundle the Dart Runtime in a [Lambda layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html) and use JIT compilation within the lambda execution to run a Dart program. The other is to compile a shipable binary of the Dart program.

Dart `>= 2.6` introduced `dart2native`. The [tool](https://dart.dev/tools/dart2native) uses AOT (ahead-of-time) to compile a Dart program to [native x64 machine code](https://dart.dev/platforms). This standalone executable is native machine code that's compiled from the specific Dart file and its dependencies, plus a small Dart runtime that handles type checking and garbage collection.

We decided to use the later approach rather then the just-in-time compilation of Dart files. The main reason for this decision is that we wanted to avoid having to ship and maintain a standalone Dart runtime version. We would eventually have to deprecate versions, or always update the version when moving forward. Furthermore, shipping a binary has the advantage of having an always runnable version of your function in addition to performance benefits.

We want to highlight [Firecracker open-source innovation](https://www.youtube.com/watch?v=yDplzXEdBTI) from re:Invent 2019 which gives you a brief overview of [Firecracker](https://firecracker-microvm.github.io/) which is the underlying technology of AWS Lambda.

## Use

```
dependencies:
  aws_lambda_dart_runtime: ^1.0.3+1
```

[Docs](https://awslabs.github.io/aws-lambda-dart-runtime/) are available. They are also accessible in the [`docs`](https://github.com/awslabs/aws-lambda-dart-runtime/blob/docs) folder.

```bash
# access the docs local
pub global activate dhttpd
dhttpd --path docs
```

> you can generate the docs with `dartdoc --output docs`

## Future & Ideas

- Support [Serverless framework](https://serverless.com/framework/)
- Automate the build process
- Better tracing and logging

## Limitations

- No Just-in-time (JIT) support
- Requires Dart `>= 2.6`
- No cross-platform compile support (see [#28617](https://github.com/dart-lang/sdk/issues/28617)).

## Events

There are a number of events that come with the Dart Runtime.

- Application Load Balancer
- Alexa
- API Gateway
- AppSync
- Cloudwatch
- Cognito
- DynamoDB
- Kinesis
- S3
- SQS

You can also register custom events.

```dart
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

class MyCustomEvent {
  factory MyCustomEvent.fromJson(Map<String, dynamic> json) =>
      MyCustomEvent(json);

  const MyCustomEvent();
}

void main() async {
  final Handler<MyCustomEvent> successHandler =
      (context, event) async {
    return InvocationResult(context.requestId, "SUCCESS");
  };

  Runtime()
    ..registerEvent<MyCustomEvent>((Map<String, dynamic> json) => MyCustomEvent.from(json))
    ..registerHandler<MyCustomEvent>("doesnt.matter", successHandler)
    ..invoke();
}
```

## Example

The example in [`main.dart`](https://github.com/awslabs/aws-lambda-dart-runtime/blob/master/example/lib/main.dart) show how the package is intended to be used. Because `dart2native` does not support cross-platform compilation, you can use the [`google/dart`](https://hub.docker.com/r/google/dart/) (:warning: if you are on `Linux` you can ignore this) container to build the project. The `build.sh` script automates the build process in the container.

```
  # will build the binary in the container
  cd example; docker run -v $PWD:/app --entrypoint app/build.sh google/dart && zip lambda.zip bootstrap && rm bootstrap
```

You will see the `lambda.zip` which you can upload manually, or use the client of your choice.

What you see in the example is an example of the interface to the Dart Runtime that we created.

You will have to make `aws_lambda_dart_runtime` a dependency of your project.

```
...
dependencies:
  aws_lambda_dart_runtime:
...
```

We support to use multiple handlers in one executable. The following example shows to register one handler.

```dart
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

void main() async {
  /// This demo's handling an API Gateway request.
  final Handler<AwsApiGatewayEvent> helloApiGateway = (context, event) async {
    final response = {"message": "hello ${context.requestId}"};

    /// it returns an encoded response to the gateway
    return InvocationResult(
        context.requestId, AwsApiGatewayResponse.fromJson(response));
  };

  /// The Runtime is a singleton. You can define the handlers as you wish.
  Runtime()
    ..registerHandler<AwsApiGatewayEvent>("hello.apigateway", helloApiGateway)
    ..invoke();
}
```

This example registers the `hello.apigateway` handler with the function to execute for this handler. The handler function is typed to receive a [Amazon API Gateway Event](https://aws.amazon.com/api-gateway) and it returns a response to the invoking gateway. We support many other [events](#events). Handler functions get a `Context` injected with the needed information about the invocation. You can also register your own custom events via `Runtime.registerEvent<T>(Handler<T>)` (see [events](#events)).

### Deployment

The deployment is a manual task right now. We have a [`example/build.sh`](https://github.com/awslabs/aws-lambda-dart-runtime/blob/master/example/build.sh) script which make the process a bit easier. There are three steps to get your code ready to be shipped.

1. Compile your Dart program with `dart2native main.dart -o bootstrap`
2. Create a `.zip` file with `zip lambda.zip bootstrap`
3. Upload the `lambda.zip` to a S3 bucket or use the [AWS CLI](https://aws.amazon.com/cli) to upload it

> again, you have to build this on Linux, because `dart2native` does not support cross-compiling

When you created your function and upload it via the the console. Please, replace `arn:aws:iam::xxx:xxx` with the role you created for your lambda.

```bash
aws lambda create-function --function-name dartTest \
  --handler hello.apigateway \
  --zip-file fileb://./lambda.zip \
  --runtime provided \
  --role arn:aws:iam::xxx:xxx \
  --environment Variables={DART_BACKTRACE=1} \
  --tracing-config Mode=Active
```

Updating a function is a fairly easy task. Rebuild your `lambda.zip` package and execute the following command.

```
aws lambda update-function-code --function-name dartTest --zip-file fileb://./lambda.zip

```

## Development

If you want to use the [Repository](https://github.com/awslabs/aws-lambda-dart-runtime.git) directly you can clone it and overwrite the dependency in your `pubspec.yaml` as follows.

```yaml
dependency_overrides:
  aws_lambda_dart_runtime:
    path: <path_to_source>
```

The [`data`](https://github.com/aws-lambda-dart-runtime/data) folder contains examples of the used events. We use this to run our tests, but you can also use them to implement new features. If you want to request the processing of a new event, you may provide a payload here.

```bash
# run the tests
pub run test
```

## License

[Apache 2.0](/LICENSE)

We :blue_heart: Dart.
