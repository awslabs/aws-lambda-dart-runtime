import 'dart:io' show Platform;
import 'package:meta/meta.dart';

import '../client/client.dart';

/// Context contains the Lambda execution context information.
/// They are either provided via [Platform.environment] or [NextInvocation]
/// which is the result from the Lambda API.
///
/// Note: this should not be used directly.
class Context {
  /// These are the constants used to map [Platform.environment]
  /// which are specific to the Lambda execution environment.
  static const _kAWSLambdaHandler = '_HANDLER';
  static const _kAWSLambdaFunctionName = 'AWS_LAMBDA_FUNCTION_NAME';
  static const _kAWSLambdaFunctionVersion = 'AWS_LAMBDA_FUNCTION_VERSION';
  static const _kAWSLambdaLogGroupName = 'AWS_LAMBDA_LOG_GROUP_NAME';
  static const _kAWSLambdaLogStreamName = 'AWS_LAMBDA_LOG_STREAM_NAME';
  static const _kAWSLambdaFunctionMemorySize =
      'AWS_LAMBDA_FUNCTION_MEMORY_SIZE';
  static const _kAWSLambdaRegion = 'AWS_REGION';
  static const _kAWSLambdaExecutionEnv = 'AWS_EXECUTION_ENV';
  static const _kAWSLambdaAccessKey = 'AWS_ACCESS_KEY_ID';
  static const _kAWSLambdaSecretAccesKey = 'AWS_SECRET_ACCESS_KEY';
  static const _kAWSLambdaSessionToken = 'AWS_SESSION_TOKEN';

  /// Creates a new [Context] from [NextInvocation] which is the data
  /// from the Lambda Runtime Interface for the next [Handler<T>] invocation.
  static Context fromNextInvocation(NextInvocation nextInvocation) {
    return Context(
      handler: Client.handlerName,
      requestId: nextInvocation.requestId,
      invokedFunction: nextInvocation.invokedFunctionArn,
    );
  }

  /// Handler that is used for the invocation of the function
  String handler;

  /// Name of the function that is invoked.
  String functionName;

  /// Version of the function that is invoked.
  String functionVersion;

  /// Memory sized that is allocated to execution of the function.
  String functionMemorySize;

  /// Cloudwatch LogGroup that is associated with the Lambda.
  String logGroupName;

  /// Cloudwach LogStream that is associated with the Lambda.
  String logStreamName;

  /// Region that this function exists in.
  String region;

  /// The execution environment of the function.
  String executionEnv;

  /// Access key that is acquired via STS.
  String accessKey;

  /// Secret access key that is acquired via STS.
  String secretAccessKey;

  /// The session token from STS.
  String sessionToken;

  /// Id of the request.
  /// You can use this to track the request for the invocation.
  String requestId;

  /// The ARN to identify the function.
  String invokedFunctionArn;

  Context({
    @required String handler,
    String functionName,
    String functionMemorySize,
    String logGroupName,
    String logStreamName,
    @required String requestId,
    String invokedFunction,
    String region,
    String executionEnv,
    String accessKey,
    String secretAccessKey,
    String sessionToken,
  }) {
    assert(requestId != null);
    assert(handler != null);

    this.handler = handler ?? Platform.environment[_kAWSLambdaHandler];
    this.functionName =
        functionName ?? Platform.environment[_kAWSLambdaFunctionName];
    functionVersion =
        functionVersion ?? Platform.environment[_kAWSLambdaFunctionVersion];
    this.functionMemorySize = functionMemorySize ??
        Platform.environment[_kAWSLambdaFunctionMemorySize];
    this.logGroupName =
        logGroupName ?? Platform.environment[_kAWSLambdaLogGroupName];
    this.logStreamName =
        logStreamName ?? Platform.environment[_kAWSLambdaLogStreamName];
    this.requestId = requestId;
    invokedFunctionArn = invokedFunction;
    this.region = region ?? Platform.environment[_kAWSLambdaRegion];
    this.executionEnv =
        executionEnv ?? Platform.environment[_kAWSLambdaExecutionEnv];
    this.accessKey = accessKey ?? Platform.environment[_kAWSLambdaAccessKey];
    this.secretAccessKey =
        secretAccessKey ?? Platform.environment[_kAWSLambdaSecretAccesKey];
    this.sessionToken =
        sessionToken ?? Platform.environment[_kAWSLambdaSessionToken];
  }

  /// Allows to copy a created [Context] over with some new settings.
  Context copyWith({
    String handler,
    String functionName,
    String functionMemorySize,
    String logGroupName,
    String logStreamName,
    String requestId,
    String invokedFunction,
    String region,
    String executionEnv,
    String accessKey,
    String secretAccessKey,
    String sessionToken,
  }) {
    return Context(
        handler: handler ?? this.handler,
        functionName: functionName ?? this.functionName,
        functionMemorySize: functionMemorySize ?? this.functionMemorySize,
        logGroupName: logGroupName ?? this.logGroupName,
        logStreamName: logStreamName ?? this.logStreamName,
        requestId: requestId ?? this.requestId,
        invokedFunction: invokedFunction ?? invokedFunctionArn,
        region: region ?? this.region,
        executionEnv: executionEnv ?? this.executionEnv,
        accessKey: accessKey ?? this.accessKey,
        secretAccessKey: secretAccessKey ?? this.secretAccessKey,
        sessionToken: sessionToken ?? this.sessionToken);
  }
}
