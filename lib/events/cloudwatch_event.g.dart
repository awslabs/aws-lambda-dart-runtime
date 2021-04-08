// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloudwatch_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsCloudwatchEvent _$AwsCloudwatchEventFromJson(Map<String, dynamic> json) {
  return AwsCloudwatchEvent(
    resources:
        (json['resources'] as List<dynamic>?)?.map((e) => e as String).toList(),
    region: json['region'] as String?,
    id: json['id'] as String?,
    source: json['source'] as String?,
    account: json['account'] as String?,
    detailType: json['detail-type'] as String?,
    detail: json['detail'] as Map<String, dynamic>?,
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
  );
}

Map<String, dynamic> _$AwsCloudwatchEventToJson(AwsCloudwatchEvent instance) =>
    <String, dynamic>{
      'resources': instance.resources,
      'region': instance.region,
      'id': instance.id,
      'source': instance.source,
      'account': instance.account,
      'detail-type': instance.detailType,
      'detail': instance.detail,
      'time': instance.time?.toIso8601String(),
    };
