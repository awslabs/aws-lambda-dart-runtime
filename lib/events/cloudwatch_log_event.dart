import 'package:aws_lambda_dart_runtime/runtime/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloudwatch_log_event.g.dart';

// {
//   "awslogs": {
//     "data": "H4sIAAAAAAAAAHWPwQqCQBCGX0Xm7EFtK+smZBEUgXoLCdMhFtKV3akI8d0bLYmibvPPN3wz00CJxmQnTO41whwWQRIctmEcB6sQbFC3CjW3XW8kxpOpP+OC22d1Wml1qZkQGtoMsScxaczKN3plG8zlaHIta5KqWsozoTYw3/djzwhpLwivWFGHGpAFe7DL68JlBUk+l7KSN7tCOEJ4M3/qOI49vMHj+zCKdlFqLaU2ZHV2a4Ct/an0/ivdX8oYc1UVX860fQDQiMdxRQEAAA=="
//   }
// }

/// Cloudwatch Log Event ...
@JsonSerializable()
class AwsCloudwatchLogEvent extends Event {
  /// awslogs ...
  @JsonKey()
  final Map<String, dynamic>? awslogs;

  factory AwsCloudwatchLogEvent.fromJson(Map<String, dynamic> json) =>
      _$AwsCloudwatchLogEventFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCloudwatchLogEventToJson(this);

  const AwsCloudwatchLogEvent({this.awslogs});
}
