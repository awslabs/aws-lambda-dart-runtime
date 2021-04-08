// GENERATED CODE - DO NOT MODIFY BY HAND

part of 's3_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsS3Event _$AwsS3EventFromJson(Map<String, dynamic> json) {
  return AwsS3Event(
    records: (json['Records'] as List<dynamic>?)
        ?.map((e) => AwsS3EventRecord.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AwsS3EventToJson(AwsS3Event instance) =>
    <String, dynamic>{
      'Records': instance.records,
    };

AwsS3EventRecord _$AwsS3EventRecordFromJson(Map<String, dynamic> json) {
  return AwsS3EventRecord(
    eventName: json['eventName'] as String?,
    eventSource: json['eventSource'] as String?,
    awsRegion: json['awsRegion'] as String?,
    eventTime: json['eventTime'] == null
        ? null
        : DateTime.parse(json['eventTime'] as String),
    eventVersion: json['eventVersion'] as String?,
    userIdentity: json['userIdentity'] == null
        ? null
        : AwsS3UserIdentity.fromJson(
            json['userIdentity'] as Map<String, dynamic>),
    requestParameters:
        (json['requestParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseElements: (json['responseElements'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    s3: json['s3'] == null
        ? null
        : AwsS3Data.fromJson(json['s3'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsS3EventRecordToJson(AwsS3EventRecord instance) =>
    <String, dynamic>{
      'eventVersion': instance.eventVersion,
      'eventSource': instance.eventSource,
      'awsRegion': instance.awsRegion,
      'eventTime': instance.eventTime?.toIso8601String(),
      'eventName': instance.eventName,
      'userIdentity': instance.userIdentity,
      'requestParameters': instance.requestParameters,
      'responseElements': instance.responseElements,
      's3': instance.s3,
    };

AwsS3Data _$AwsS3DataFromJson(Map<String, dynamic> json) {
  return AwsS3Data(
    s3SchemaVersion: json['s3SchemaVersion'] as String?,
    configurationId: json['configurationId'] as String?,
    bucket: json['bucket'] == null
        ? null
        : AwsS3Bucket.fromJson(json['bucket'] as Map<String, dynamic>),
    object: json['object'] == null
        ? null
        : AWSS3EventObject.fromJson(json['object'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsS3DataToJson(AwsS3Data instance) => <String, dynamic>{
      's3SchemaVersion': instance.s3SchemaVersion,
      'configurationId': instance.configurationId,
      'bucket': instance.bucket,
      'object': instance.object,
    };

AwsS3Bucket _$AwsS3BucketFromJson(Map<String, dynamic> json) {
  return AwsS3Bucket(
    name: json['name'] as String?,
    ownerIdentity: json['ownerIdentity'] == null
        ? null
        : AwsS3UserIdentity.fromJson(
            json['ownerIdentity'] as Map<String, dynamic>),
    arn: json['arn'] as String?,
  );
}

Map<String, dynamic> _$AwsS3BucketToJson(AwsS3Bucket instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ownerIdentity': instance.ownerIdentity,
      'arn': instance.arn,
    };

AWSS3EventObject _$AWSS3EventObjectFromJson(Map<String, dynamic> json) {
  return AWSS3EventObject(
    key: json['key'] as String?,
    size: json['size'] as int?,
    eTag: json['eTag'] as String?,
    sequencer: json['sequencer'] as String?,
  );
}

Map<String, dynamic> _$AWSS3EventObjectToJson(AWSS3EventObject instance) =>
    <String, dynamic>{
      'key': instance.key,
      'size': instance.size,
      'eTag': instance.eTag,
      'sequencer': instance.sequencer,
    };

AwsS3UserIdentity _$AwsS3UserIdentityFromJson(Map<String, dynamic> json) {
  return AwsS3UserIdentity(
    principalId: json['principalId'] as String?,
  );
}

Map<String, dynamic> _$AwsS3UserIdentityToJson(AwsS3UserIdentity instance) =>
    <String, dynamic>{
      'principalId': instance.principalId,
    };
