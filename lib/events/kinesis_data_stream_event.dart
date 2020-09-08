import 'package:aws_lambda_dart_runtime/runtime/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kinesis_data_stream_event.g.dart';

/// Kinesis .....
@JsonSerializable()
class AwsKinesisDataStream extends Event {
  /// Partition Key ...
  @JsonKey()
  final String partitionKey;

  /// Kinesis Schema Version ...
  @JsonKey()
  final String kinesisSchemaVersion;

  /// Data ...
  @JsonKey()
  final String data;

  /// Sequenzer Number ...
  @JsonKey()
  final String sequenceNumber;

  /// Approximate Arrival Timestamp ...
  @JsonKey()
  final int approximateArrivalTimestamp;

  factory AwsKinesisDataStream.fromJson(Map<String, dynamic> json) {
    return _$AwsKinesisDataStreamFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AwsKinesisDataStreamToJson(this);

  const AwsKinesisDataStream(
      {this.partitionKey,
      this.kinesisSchemaVersion,
      this.data,
      this.sequenceNumber,
      this.approximateArrivalTimestamp});
}

/// Kinesis record that is send via [AwsKinesisEvent].
@JsonSerializable()
class AwsKinesisDataStreamRecord {
  /// Data ...
  @JsonKey()
  final AwsKinesisDataStream kinesis;

  /// Source of the Event.
  @JsonKey()
  final String eventSource;

  /// Event Id ...
  @JsonKey()
  final String eventID;

  /// Event Version ...
  @JsonKey()
  final String eventVersion;

  /// Event Name ...
  @JsonKey()
  final String eventName;

  /// Event Source ARN ...
  @JsonKey()
  final String eventSourceARN;

  /// Invokey Identity ARN ...
  @JsonKey()
  final String invokeIdentityArn;

  /// Aws Region this event was emitted from
  @JsonKey()
  final String awsRegion;

  factory AwsKinesisDataStreamRecord.fromJson(Map<String, dynamic> json) {
    return _$AwsKinesisDataStreamRecordFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AwsKinesisDataStreamRecordToJson(this);

  const AwsKinesisDataStreamRecord(
      {this.kinesis,
      this.invokeIdentityArn,
      this.eventName,
      this.eventID,
      this.eventSource,
      this.eventVersion,
      this.eventSourceARN,
      this.awsRegion});
}

/// Kinesis Event ...
@JsonSerializable()
class AwsKinesisDataStreamEvent extends Event {
  /// The SQS message records that have been send with the event.
  @JsonKey(name: 'Records')
  final List<AwsKinesisDataStreamRecord> records;

  factory AwsKinesisDataStreamEvent.fromJson(Map<String, dynamic> json) {
    return _$AwsKinesisDataStreamEventFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AwsKinesisDataStreamEventToJson(this);

  const AwsKinesisDataStreamEvent({this.records});
}
