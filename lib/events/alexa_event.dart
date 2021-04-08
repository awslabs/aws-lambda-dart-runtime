import 'package:aws_lambda_dart_runtime/runtime/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alexa_event.g.dart';

/// Header are meta information about the event.
@JsonSerializable()
class AwsAlexaEventHeader {
  /// Version of the send payload.
  @JsonKey()
  final String? payloadVersion;

  /// Namespace of the event.
  @JsonKey()
  final String? namespace;

  /// Name of the event
  @JsonKey()
  final String? name;

  factory AwsAlexaEventHeader.fromJson(Map<String, dynamic> json) =>
      _$AwsAlexaEventHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$AwsAlexaEventHeaderToJson(this);

  const AwsAlexaEventHeader({this.namespace, this.payloadVersion, this.name});
}

/// Event send by an Application Load Balancer to the
/// invocation to the Lambda.
@JsonSerializable()
class AwsAlexaEvent extends Event {
  /// Meta information about the event.
  @JsonKey()
  final AwsAlexaEventHeader? header;

  /// Payload of the event send by Alexa.
  @JsonKey()
  final Map<String, dynamic>? payload;

  factory AwsAlexaEvent.fromJson(Map<String, dynamic> json) =>
      _$AwsAlexaEventFromJson(json);

  Map<String, dynamic> toJson() => _$AwsAlexaEventToJson(this);

  const AwsAlexaEvent({this.header, this.payload});
}
