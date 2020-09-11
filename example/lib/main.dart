import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

void main() async {
  /// This demo's handling an API Gateway request.
  final helloApiGateway = (context, event) async {
    final response = {'message': 'hello ${context.requestId}'};

    /// it returns an response to the gateway
    return AwsApiGatewayResponse.fromJson(response);
  };

  /// The Runtime is a singleton. You can define the handlers as you wish.
  Runtime()
    ..registerHandler<AwsApiGatewayEvent>('hello.apigateway', helloApiGateway)
    ..invoke();
}
