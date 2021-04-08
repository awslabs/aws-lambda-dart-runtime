// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appsync_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsAppSyncEvent _$AwsAppSyncEventFromJson(Map<String, dynamic> json) {
  return AwsAppSyncEvent(
    version: json['version'] as String?,
    operation: json['operation'] as String?,
    payload: json['payload'] as String?,
  );
}

Map<String, dynamic> _$AwsAppSyncEventToJson(AwsAppSyncEvent instance) =>
    <String, dynamic>{
      'version': instance.version,
      'operation': instance.operation,
      'payload': instance.payload,
    };
