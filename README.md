# Dart Runtime for AWS Lambda

This package makes it easy to write your AWS Lambda Functions in Dart.

**_Features_**

- Performance `< 50ms` on innvocation and `< 50MB` memory consumption.
- No need to ship the Dart Runtime
- Supports custom typed events
- Supports multiple handlers
- Supports to write typed events

> this package requires Dart `>= 2.6`
> currently `dart2native` only supports building for the platform it is run on, so you must either build on a `Linux` machine or use `docker`

[Dart](https://dart.dev/) is a unsupported [AWS Lambda](https://aws.amazon.com/lambda/) runtime. However, we can leverage a [custom runtime](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-custom.html) to use the [Dart](https://dart.dev/) programming language. There are two options to use [Dart](https://dart.dev/). We can bundle the Dart Runtime in a Lambda Layer and use JIT compilation to run a Dart program. The other is to compile a shipable binary of the Dart program. Dart `>= 2.6` introduced `dart2native`. The [tool](https://dart.dev/tools/dart2native) uses AOT (ahead-of-time) to compile a Dart program to [native x64 machine code](https://dart.dev/platforms). The created standalone executable is native machine code that's compiled from the specific Dart file and its dependencies, plus a small Dart runtime that handles type checking and gargabe collection.

We decides to use this approach rather then the just-in-time compilation of Dart files, because we do not want to ship different runtime versions to bootstrap the runtime. Also, this has the advantage of not needing to future support any runtime or deprecate older ones.

## Use

:warning: We are currently working on becoming a publisher on [pub.dev](https://pub.dev).

```
dependencies:
  aws_lambda_dart_runtime:
    git: git://github.com/awslabs/aws-lambda-dart-runtime.git
```

## Limitations

- No Just-in-time (JIT) support
- Requires Dart `>= 2.6`
- No cross-platform compile support (see [#28617](https://github.com/dart-lang/sdk/issues/28617).

## Ideas

- Support [Serverless framework](https://serverless.com/framework/)
- Automate the build process
- Better tracing and logging

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

The example in `[examples/main.dart](examples/main.dart)` is showing how the package is intended to be used. Because `dart2native` is not supporting cross-platform compilation, you can use the `google/dart` container to build the project. The `build.sh` script is automating the build process in the container.

```
  # will build the binary in the container
  docker run -v $PWD:/app --entrypoint /app/example/build.sh google/dart && (cd example && zip lambda.zip bootstrap && rm bootstrap)
```

You will see the `lambda.zip` which you can upload manually, or use the client of your choice. The building process involves the `build.sh` script, because we do not want to test the package without the need to publish it.

What you see im the example is an example of the interface to the Dart Runtime that we created.

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
  final Handler<AwsS3NotificationEvent> successHandler =
      (context, event) async {
    return InvocationResult(context.requestId, "SUCCESS");
  };

  Runtime()
    ..registerHandler<AwsS3NotificationEvent>("doesnt.matter", successHandler)
    ..invoke();
}
```

This example registers the `doesnt.matter` handler with the function to execute for this handler. The handler function is types to receive an Amazon S3 event. We support multiple event types. The handlers functions get the specified typed event inject in their context. You can also register your own custom events via `Runtime.registerEvent<T>(Handler<T>)`.

### Deployment

The deployment is a manual task right now. We have a `[examples/build.sh](examples/build.sh)` script which make the process a bit easier. There are three steps to get your code ready to be shiped.

1. Compile your Dart program with `dart2native main.dart -o bootstrap`
2. Create a `.zip` file with `zip lambda.zip bootstrap`
3. Upload the `lambda.zip` to a S3 bucket or use the [AWS CLI](https://aws.amazon.com/cli) to upload it

When you created your function and upload it via the the console. Please, replace `arn:aws:iam::xxx:xxx` with the role you created for your lambda.

```bash
 aws lambda create-function --function-name dartTest \
  --handler doesnt.matter \
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

## License

[Apache 2.0](/LICENSE)
