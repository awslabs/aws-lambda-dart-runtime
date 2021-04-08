import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

import '../events/alb_event.dart';
import '../events/alexa_event.dart';
import '../events/apigateway_event.dart';
import '../events/appsync_event.dart';
import '../events/cloudwatch_event.dart';
import '../events/cloudwatch_log_event.dart';
import '../events/cognito_event.dart';
import '../events/dynamodb_event.dart';
import '../events/s3_event.dart';
import '../events/sqs_event.dart';
import '../events/kinesis_data_stream_event.dart';

/// Event is the abstraction for every event that
/// can be ingested by a handler.
///
/// Note is currently not supported to register your
/// own events here.
abstract class Event {
  const Event();
  static final Map<Type, Function(Map<String, dynamic>)> _registry = {
    AwsCognitoEvent: (Map<String, dynamic>? json) =>
        AwsCognitoEvent.fromJson(json!),
    AwsS3Event: (Map<String, dynamic>? json) => AwsS3Event.fromJson(json!),
    AwsApiGatewayEvent: (Map<String, dynamic>? json) =>
        AwsApiGatewayEvent.fromJson(json!),
    AwsAppSyncEvent: (Map<String, dynamic>? json) =>
        AwsAppSyncEvent.fromJson(json!),
    AwsALBEvent: (Map<String, dynamic>? json) => AwsALBEvent.fromJson(json!),
    AwsAlexaEvent: (Map<String, dynamic>? json) =>
        AwsAlexaEvent.fromJson(json!),
    AwsSQSEvent: (Map<String, dynamic>? json) => AwsSQSEvent.fromJson(json!),
    AwsCloudwatchEvent: (Map<String, dynamic>? json) =>
        AwsCloudwatchEvent.fromJson(json!),
    AwsCloudwatchLogEvent: (Map<String, dynamic>? json) =>
        AwsCloudwatchLogEvent.fromJson(json!),
    AwsDynamoDBUpdateEvent: (Map<String, dynamic>? json) =>
        AwsDynamoDBUpdateEvent.fromJson(json!),
    AwsKinesisDataStreamEvent: (Map<String, dynamic>? json) =>
        AwsKinesisDataStreamEvent.fromJson(json!)
  };

  /// Checks if a type of event is already registered.
  static bool exists<T>() {
    return Event._registry.containsKey(T);
  }

  /// Returs the value of a registered event. It is [null]
  /// if no such event has been registered.
  static T Function(Map<String, dynamic>)? value<T extends Event>() =>
      Event._registry[T] as T Function(Map<String, dynamic>)?;

  /// Registers an event.
  static void registerEvent<T>(T Function(Map<String, dynamic>) func) =>
      Event._registry[T] = func;

  /// Deregisters an event.
  static void deregisterEvent<T>() => Event._registry.remove(T);

  /// Creates a new event from a handler type with the [NextInvocation.response].
  static dynamic fromHandler<T>(Type type, Map<String, dynamic> json) =>
      _registry[type]!(json);
}
