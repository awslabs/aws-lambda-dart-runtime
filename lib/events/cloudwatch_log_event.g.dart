// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloudwatch_log_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsCloudwatchLogEvent _$AwsCloudwatchLogEventFromJson(
    Map<String, dynamic> json) {
  return AwsCloudwatchLogEvent(
    awslogs: json['awslogs'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$AwsCloudwatchLogEventToJson(
        AwsCloudwatchLogEvent instance) =>
    <String, dynamic>{
      'awslogs': instance.awslogs,
    };
