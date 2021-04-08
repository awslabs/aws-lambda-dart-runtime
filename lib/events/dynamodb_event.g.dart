// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamodb_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsDynamoDBUpdateRecord _$AwsDynamoDBUpdateRecordFromJson(
    Map<String, dynamic> json) {
  return AwsDynamoDBUpdateRecord(
    keys: json['Keys'] as Map<String, dynamic>?,
    oldImage: json['NewImage'] as Map<String, dynamic>?,
    newImage: json['OldImage'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$AwsDynamoDBUpdateRecordToJson(
        AwsDynamoDBUpdateRecord instance) =>
    <String, dynamic>{
      'Keys': instance.keys,
      'NewImage': instance.oldImage,
      'OldImage': instance.newImage,
    };

AwsDynamoDBUpdateEventRecord _$AwsDynamoDBUpdateEventRecordFromJson(
    Map<String, dynamic> json) {
  return AwsDynamoDBUpdateEventRecord(
    eventId: json['eventId'] as String?,
    eventName: json['eventName'] as String?,
    eventSource: json['eventSource'] as String?,
    eventVersion: json['eventVersion'] as String?,
    awsRegion: json['awsRegion'] as String?,
    eventSourceARN: json['eventSourceARN'] as String?,
  );
}

Map<String, dynamic> _$AwsDynamoDBUpdateEventRecordToJson(
        AwsDynamoDBUpdateEventRecord instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'eventName': instance.eventName,
      'eventSource': instance.eventSource,
      'eventVersion': instance.eventVersion,
      'awsRegion': instance.awsRegion,
      'eventSourceARN': instance.eventSourceARN,
    };

AwsDynamoDBUpdateEvent _$AwsDynamoDBUpdateEventFromJson(
    Map<String, dynamic> json) {
  return AwsDynamoDBUpdateEvent(
    records: (json['Records'] as List<dynamic>?)
        ?.map((e) =>
            AwsDynamoDBUpdateEventRecord.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AwsDynamoDBUpdateEventToJson(
        AwsDynamoDBUpdateEvent instance) =>
    <String, dynamic>{
      'Records': instance.records,
    };
