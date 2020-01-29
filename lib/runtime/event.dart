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
  static final _registry = {
    AwsCognitoEvent: (Map<String, dynamic> json) =>
        AwsCognitoEvent.fromJson(json),
    AwsS3Event: (Map<String, dynamic> json) => AwsS3Event.fromJson(json),
    AwsApiGatewayEvent: (Map<String, dynamic> json) =>
        AwsApiGatewayEvent.fromJson(json),
    AwsAppSyncEvent: (Map<String, dynamic> json) =>
        AwsAppSyncEvent.fromJson(json),
    AwsALBEvent: (Map<String, dynamic> json) => AwsALBEvent.fromJson(json),
    AwsAlexaEvent: (Map<String, dynamic> json) => AwsAlexaEvent.fromJson(json),
    AwsSQSEvent: (Map<String, dynamic> json) => AwsSQSEvent.fromJson(json),
    AwsCloudwatchEvent: (Map<String, dynamic> json) =>
        AwsCloudwatchEvent.fromJson(json),
    AwsCloudwatchLogEvent: (Map<String, dynamic> json) =>
        AwsCloudwatchLogEvent.fromJson(json),
    AwsDynamoDBUpdateEvent: (Map<String, dynamic> json) =>
        AwsDynamoDBUpdateEvent.fromJson(json),
    AwsKinesisDataStreamEvent: (Map<String, dynamic> json) =>
        AwsKinesisDataStreamEvent.fromJson(json)
  };

  /// Checks if a type of event is already registered.
  static exists<T>() {
    return Event._registry.containsKey(T);
  }

  /// Returs the value of a registered event. It is [null]
  /// if no such event has been registered.
  static value<T>() {
    return Event._registry[T];
  }

  /// Registers an event.
  static registerEvent<T>(func) {
    Event._registry[T] = func;
  }

  /// Deregisters an event.
  static deregisterEvent<T>() {
    Event._registry.remove(T);
  }

  /// Creates a new event from a handler type with the [NextInvocation.response].
  static fromHandler<T>(Type type, Map<String, dynamic> json) {
    return _registry[type](json);
  }
}
