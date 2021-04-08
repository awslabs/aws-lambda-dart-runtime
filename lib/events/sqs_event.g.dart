// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sqs_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsSQSEventRecord _$AwsSQSEventRecordFromJson(Map<String, dynamic> json) {
  return AwsSQSEventRecord(
    messageId: json['messageId'] as String?,
    body: json['body'] as String?,
    receiptHandle: json['receiptHandle'] as String?,
    attributes: json['attributes'] as Map<String, dynamic>?,
    messageAttributes: json['messageAttributes'] as Map<String, dynamic>?,
    md5OfBody: json['md5OfBody'] as String?,
    eventSource: json['eventSource'] as String?,
    eventSourceARN: json['eventSourceARN'] as String?,
    awsRegion: json['awsRegion'] as String?,
  );
}

Map<String, dynamic> _$AwsSQSEventRecordToJson(AwsSQSEventRecord instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'receiptHandle': instance.receiptHandle,
      'body': instance.body,
      'attributes': instance.attributes,
      'messageAttributes': instance.messageAttributes,
      'md5OfBody': instance.md5OfBody,
      'eventSource': instance.eventSource,
      'eventSourceARN': instance.eventSourceARN,
      'awsRegion': instance.awsRegion,
    };

AwsSQSEvent _$AwsSQSEventFromJson(Map<String, dynamic> json) {
  return AwsSQSEvent(
    records: (json['Records'] as List<dynamic>?)
        ?.map((e) => AwsSQSEventRecord.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AwsSQSEventToJson(AwsSQSEvent instance) =>
    <String, dynamic>{
      'Records': instance.records,
    };
