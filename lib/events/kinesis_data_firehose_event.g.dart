// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinesis_data_firehose_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsKinesisFirehoseData _$AwsKinesisFirehoseDataFromJson(
    Map<String, dynamic> json) {
  return AwsKinesisFirehoseData(
    recordId: json['recordId'] as String?,
    data: json['data'] as String?,
    approximateArrivalTimestamp: json['approximateArrivalTimestamp'] as int?,
  );
}

Map<String, dynamic> _$AwsKinesisFirehoseDataToJson(
        AwsKinesisFirehoseData instance) =>
    <String, dynamic>{
      'recordId': instance.recordId,
      'approximateArrivalTimestamp': instance.approximateArrivalTimestamp,
      'data': instance.data,
    };

AwsKinesisFirehoseDataEvent _$AwsKinesisFirehoseDataEventFromJson(
    Map<String, dynamic> json) {
  return AwsKinesisFirehoseDataEvent(
    records: (json['records'] as List<dynamic>?)
        ?.map((e) => AwsKinesisFirehoseData.fromJson(e as Map<String, dynamic>))
        .toList(),
    invocationId: json['invocationId'] as String?,
    deliveryStreamArn: json['deliveryStreamArn'] as String?,
    region: json['region'] as String?,
  );
}

Map<String, dynamic> _$AwsKinesisFirehoseDataEventToJson(
        AwsKinesisFirehoseDataEvent instance) =>
    <String, dynamic>{
      'invocationId': instance.invocationId,
      'deliveryStreamArn': instance.deliveryStreamArn,
      'region': instance.region,
      'records': instance.records,
    };
