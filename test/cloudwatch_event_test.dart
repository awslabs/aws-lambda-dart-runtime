import 'dart:convert';
import 'dart:io' show File;

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:test/test.dart';

final file = 'data/cloudwatch_event.json';

final String contents = File(file).readAsStringSync();
final json = jsonDecode(contents) as Map<String, dynamic>;

void main() {
  group('cloudwatch_default', () {
    test('json got parsed and creates an event', () async {
      final event = AwsCloudwatchEvent.fromJson(json);

      expect(event.account, equals('1234567890'));
      expect(event.region, equals('eu-west-1'));
      expect(event.detailType, equals('Scheduled Event'));
      expect(event.id, equals('cdc73f9d-aea9-11e3-9d5a-835b769c0d9c'));
      expect(event.detail, equals({}));
      expect(event.time, equals(DateTime.parse('1970-01-01T00:00:00Z')));
    });
  });
}
