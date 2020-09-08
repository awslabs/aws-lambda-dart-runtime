import 'package:aws_lambda_dart_runtime/runtime/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 's3_event.g.dart';

/// Representing a recorded S3 Event send to the Lambda.
/// This can be send in batches of operations.
@JsonSerializable()
class AwsS3Event extends Event {
  @JsonKey(name: 'Records')
  final List<AwsS3EventRecord> records;

  const AwsS3Event({this.records});

  factory AwsS3Event.fromJson(Map<String, dynamic> json) =>
      _$AwsS3EventFromJson(json);

  Map<String, dynamic> toJson() => _$AwsS3EventToJson(this);
}

/// Notifcation Event for Lambda in S3.
@JsonSerializable()
class AwsS3EventRecord {
  final String eventVersion;
  final String eventSource;
  final String awsRegion;
  final DateTime eventTime;
  final String eventName;
  final AwsS3UserIdentity userIdentity;
  final Map<String, String> requestParameters;
  final Map<String, String> responseElements;
  final AwsS3Data s3;

  const AwsS3EventRecord(
      {this.eventName,
      this.eventSource,
      this.awsRegion,
      this.eventTime,
      this.eventVersion,
      this.userIdentity,
      this.requestParameters,
      this.responseElements,
      this.s3});

  factory AwsS3EventRecord.fromJson(Map<String, dynamic> json) =>
      _$AwsS3EventRecordFromJson(json);

  Map<String, dynamic> toJson() => _$AwsS3EventRecordToJson(this);
}

@JsonSerializable()
class AwsS3Data {
  String s3SchemaVersion;
  String configurationId;
  AwsS3Bucket bucket;
  AWSS3EventObject object;

  AwsS3Data(
      {this.s3SchemaVersion, this.configurationId, this.bucket, this.object});

  factory AwsS3Data.fromJson(Map<String, dynamic> json) =>
      _$AwsS3DataFromJson(json);

  Map<String, dynamic> toJson() => _$AwsS3DataToJson(this);
}

@JsonSerializable()
class AwsS3Bucket {
  String name;
  AwsS3UserIdentity ownerIdentity;
  String arn;

  AwsS3Bucket({this.name, this.ownerIdentity, this.arn});

  factory AwsS3Bucket.fromJson(Map<String, dynamic> json) =>
      _$AwsS3BucketFromJson(json);

  Map<String, dynamic> toJson() => _$AwsS3BucketToJson(this);
}

@JsonSerializable()
class AWSS3EventObject {
  String key;
  int size;
  String eTag;
  String sequencer;

  AWSS3EventObject({this.key, this.size, this.eTag, this.sequencer});

  factory AWSS3EventObject.fromJson(Map<String, dynamic> json) =>
      _$AWSS3EventObjectFromJson(json);

  Map<String, dynamic> toJson() => _$AWSS3EventObjectToJson(this);
}

@JsonSerializable()
class AwsS3UserIdentity {
  String principalId;

  AwsS3UserIdentity({this.principalId});

  factory AwsS3UserIdentity.fromJson(Map<String, dynamic> json) =>
      _$AwsS3UserIdentityFromJson(json);

  Map<String, dynamic> toJson() => _$AwsS3UserIdentityToJson(this);
}
