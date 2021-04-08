import 'dart:convert';
import 'dart:io' show File;

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:test/test.dart';

final file = 'data/kinesis_data_firehose_event.json';

final String contents = File(file).readAsStringSync();
final json = jsonDecode(contents) as Map<String, dynamic>?;

void main() {
  group('kinesis_firehose_default', () {
    test('json got parsed and creates an event', () async {
      final event = AwsKinesisFirehoseDataEvent.fromJson(json!);

      expect(event.records!.length, equals(1));
      expect(event.invocationId, equals('invocationIdExample'));
      expect(event.deliveryStreamArn, equals('arn:aws:kinesis:EXAMPLE'));
      expect(event.region, equals('eu-west-1'));
      expect(event.records![0].recordId,
          equals('49546986683135544286507457936321625675700192471156785154'));
      expect(
          event.records![0].approximateArrivalTimestamp, equals(1495072949453));
      expect(event.records![0].data,
          equals('SGVsbG8sIHRoaXMgaXMgYSB0ZXN0IDEyMy4='));
    });
  });
}
