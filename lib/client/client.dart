import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

/// Next invocation data wraps the data from the
/// invocation endpoint of the Lambda Runtime Interface.
class NextInvocation {
  static const runtimeRequestId = 'lambda-runtime-aws-request-id';
  static const runtimeDeadlineMs = 'lambda-runtime-aws-deadline-ms';
  static const runtimeInvokedFunctionArn =
      'lambda-runtime-invoked-functions-arn';
  static const runtimeTraceId = 'lambda-runtime-trace-id';
  static const runtimeClientContext = 'lambda-runtime-client-context';
  static const runtimeCognitoIdentity = 'lambda-runtime-cognito-identity';

  /// Raw response of invocation data that we received.
  final Map<String, dynamic> response;

  /// Request Id is the identifier of the request.
  final String requestId;

  /// Deadline milliseconds is the setting for ultimate cancelation of the invocation.
  final String deadlineMs;

  /// Invoked function ARN is the identifier of the function.
  final String invokedFunctionArn;

  /// Tracing id is the identifier for tracing like X-Ray.
  final String traceId;

  /// Client context is the context that is provided to the function.
  final String clientContext;

  /// Cognito identity is the identity that maybe is used for authorizing the request.
  final String cognitoIdentity;

  /// Digesting a [HttpClientResponse] into a [NextInvocation].
  static Future<NextInvocation> fromResponse(http.Response response) async =>
      NextInvocation(
          response: (json.decode(utf8.decode(response.bodyBytes)) as Map)
              .cast<String, dynamic>(),
          requestId: response.headers[runtimeRequestId],
          deadlineMs: response.headers[runtimeDeadlineMs],
          invokedFunctionArn: response.headers[runtimeInvokedFunctionArn],
          traceId: response.headers[runtimeTraceId],
          clientContext: response.headers[runtimeClientContext],
          cognitoIdentity: response.headers[runtimeCognitoIdentity]);

  const NextInvocation({
    @required this.requestId,
    this.deadlineMs,
    this.traceId,
    this.clientContext,
    this.cognitoIdentity,
    this.invokedFunctionArn,
    this.response,
  }) : assert(requestId != null);
}

/// Invocation result is the result that the invoked handler
/// returns and is posted to the Lambda Runtime Interface.
class InvocationResult {
  /// The Id of the request in the Lambda Runtime Interface.
  /// This is used to associate the result of the handler with
  /// the triggered execution in the Runtime.
  final String requestId;

  /// The result of the handler execution. This can contain
  /// any json-encodable data type.
  final dynamic body;

  const InvocationResult(this.requestId, this.body)
      : assert(requestId != null),
        assert(body != null);
}

/// Invocation error occurs when there has been an
/// error in the invocation of a handlers. It dynamically
/// wraps the inner [error] and attaches the [requestId] to
/// track it along the event.
class InvocationError {
  /// The error that catched during the invocation and
  /// which is posted to the Lambda Runtime Interface.
  final dynamic error;

  /// StackTrace ...
  final StackTrace stackTrace;

  /// Extracts the [InvocationError] data into a JSON
  /// representation for the Runtime Interface.
  Map<String, dynamic> toJson() => {
        'errorMessage': error.toString(),
        'errorType': 'InvocationError',
      };

  const InvocationError(this.error, this.stackTrace);
}

/// Client is the Lambda Runtime Interface client.
/// It is implemented as a singleton whereby [Client.instance]
/// always returns the already instantiated client.
class Client {
  http.Client _client;

  static final Client _singleton = Client._internal();

  factory Client() {
    return _singleton;
  }

  Client._internal() {
    _client = http.Client();
  }

  static const runtimeApiVersion = '2018-06-01';

  static String get runtimeApi =>
      Platform.environment['AWS_LAMBDA_RUNTIME_API'];

  static String get handlerName => Platform.environment['_HANDLER'];

  /// Get the next invocation from the AWS Lambda Runtime Interface (see https://docs.aws.amazon.com/lambda/latest/dg/runtimes-api.html).
  Future<NextInvocation> getNextInvocation() async {
    final response = await _client.get(Uri.parse(
        'http://${runtimeApi}/${runtimeApiVersion}/runtime/invocation/next'));
    return NextInvocation.fromResponse(response);
  }

  /// Post the invocation response to the AWS Lambda Runtime Interface.
  Future<http.Response> postInvocationResponse(
      String requestId, dynamic payload) async {
    return await _client.post(
      Uri.parse(
        'http://${runtimeApi}/${runtimeApiVersion}/runtime/invocation/$requestId/response',
      ),
      body: jsonEncode(payload),
    );
  }

  /// Post an invocation error to the AWS Lambda Runtime Interface.
  /// It takes in an [InvocationError] and the [requestId]. The [requestId]
  /// is used to map the error to the execution.
  Future<http.Response> postInvocationError(
      String requestId, InvocationError err) async {
    return await _client.post(
      Uri.parse(
        'http://${runtimeApi}/${runtimeApiVersion}/runtime/invocation/$requestId/error',
      ),
      body: jsonEncode(err),
      headers: {'Content-type': 'application/json'},
    );
  }
}
