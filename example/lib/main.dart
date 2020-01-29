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
