import 'dart:convert';
import 'dart:io' show File;

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:test/test.dart';

final file = 'data/kinesis_data_stream_event.json';

final String contents = File(file).readAsStringSync();
final json = jsonDecode(contents) as Map<String, dynamic>?;

void main() {
  group('kinesis_default', () {
    test('json got parsed and creates an event', () async {
      final event = AwsKinesisDataStreamEvent.fromJson(json!);

      expect(event.records!.length, equals(1));
      expect(event.records![0].eventSource, equals('aws:kinesis'));
      expect(
          event.records![0].eventID,
          equals(
              'shardId-000000000000:49545115243490985018280067714973144582180062593244200961'));
      expect(
          event.records![0].eventSourceARN, equals('arn:aws:kinesis:EXAMPLE'));
      expect(event.records![0].awsRegion, equals('eu-west-1'));
      expect(event.records![0].eventVersion, equals('1.0'));
      expect(
          event.records![0].invokeIdentityArn, equals('arn:aws:iam::EXAMPLE'));
      expect(
          event.records![0].kinesis!.partitionKey, equals('partitionKey-03'));
      expect(event.records![0].kinesis!.data,
          equals('SGVsbG8sIHRoaXMgaXMgYSB0ZXN0IDEyMy4='));
      expect(event.records![0].kinesis!.sequenceNumber,
          equals('49545115243490985018280067714973144582180062593244200961'));
    });
  });
}
