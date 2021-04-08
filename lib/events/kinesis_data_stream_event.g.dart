// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinesis_data_stream_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsKinesisDataStream _$AwsKinesisDataStreamFromJson(Map<String, dynamic> json) {
  return AwsKinesisDataStream(
    partitionKey: json['partitionKey'] as String?,
    kinesisSchemaVersion: json['kinesisSchemaVersion'] as String?,
    data: json['data'] as String?,
    sequenceNumber: json['sequenceNumber'] as String?,
    approximateArrivalTimestamp: json['approximateArrivalTimestamp'] as int?,
  );
}

Map<String, dynamic> _$AwsKinesisDataStreamToJson(
        AwsKinesisDataStream instance) =>
    <String, dynamic>{
      'partitionKey': instance.partitionKey,
      'kinesisSchemaVersion': instance.kinesisSchemaVersion,
      'data': instance.data,
      'sequenceNumber': instance.sequenceNumber,
      'approximateArrivalTimestamp': instance.approximateArrivalTimestamp,
    };

AwsKinesisDataStreamRecord _$AwsKinesisDataStreamRecordFromJson(
    Map<String, dynamic> json) {
  return AwsKinesisDataStreamRecord(
    kinesis: json['kinesis'] == null
        ? null
        : AwsKinesisDataStream.fromJson(
            json['kinesis'] as Map<String, dynamic>),
    invokeIdentityArn: json['invokeIdentityArn'] as String?,
    eventName: json['eventName'] as String?,
    eventID: json['eventID'] as String?,
    eventSource: json['eventSource'] as String?,
    eventVersion: json['eventVersion'] as String?,
    eventSourceARN: json['eventSourceARN'] as String?,
    awsRegion: json['awsRegion'] as String?,
  );
}

Map<String, dynamic> _$AwsKinesisDataStreamRecordToJson(
        AwsKinesisDataStreamRecord instance) =>
    <String, dynamic>{
      'kinesis': instance.kinesis,
      'eventSource': instance.eventSource,
      'eventID': instance.eventID,
      'eventVersion': instance.eventVersion,
      'eventName': instance.eventName,
      'eventSourceARN': instance.eventSourceARN,
      'invokeIdentityArn': instance.invokeIdentityArn,
      'awsRegion': instance.awsRegion,
    };

AwsKinesisDataStreamEvent _$AwsKinesisDataStreamEventFromJson(
    Map<String, dynamic> json) {
  return AwsKinesisDataStreamEvent(
    records: (json['Records'] as List<dynamic>?)
        ?.map((e) =>
            AwsKinesisDataStreamRecord.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AwsKinesisDataStreamEventToJson(
        AwsKinesisDataStreamEvent instance) =>
    <String, dynamic>{
      'Records': instance.records,
    };
