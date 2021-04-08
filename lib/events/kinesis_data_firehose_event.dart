import 'package:aws_lambda_dart_runtime/runtime/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kinesis_data_firehose_event.g.dart';

/// Kinesis .....
@JsonSerializable()
class AwsKinesisFirehoseData extends Event {
  /// Record ID ...
  @JsonKey()
  final String? recordId;

  /// Approximated Arrival Timestamp ...
  @JsonKey()
  final int? approximateArrivalTimestamp;

  /// Data ...
  @JsonKey()
  final String? data;

  factory AwsKinesisFirehoseData.fromJson(Map<String, dynamic> json) {
    return _$AwsKinesisFirehoseDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AwsKinesisFirehoseDataToJson(this);

  const AwsKinesisFirehoseData(
      {this.recordId, this.data, this.approximateArrivalTimestamp});
}

/// Kinesis Event ...
@JsonSerializable()
class AwsKinesisFirehoseDataEvent {
  /// Invocation ID ...
  @JsonKey()
  final String? invocationId;

  /// Delivery Stream ARN ...
  @JsonKey()
  final String? deliveryStreamArn;

  /// Region ...
  @JsonKey()
  final String? region;

  /// Records ...
  @JsonKey()
  final List<AwsKinesisFirehoseData>? records;

  factory AwsKinesisFirehoseDataEvent.fromJson(Map<String, dynamic> json) {
    return _$AwsKinesisFirehoseDataEventFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AwsKinesisFirehoseDataEventToJson(this);

  const AwsKinesisFirehoseDataEvent(
      {this.records, this.invocationId, this.deliveryStreamArn, this.region});
}
