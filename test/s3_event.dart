import 'dart:convert';
import 'dart:io' show File;

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:test/test.dart';

final file = 'data/s3_event.json';

final String contents = File(file).readAsStringSync();
final json = jsonDecode(contents) as Map<String, dynamic>?;

void main() {
  group('s3_default', () {
    test('json got parsed and creates an event', () async {
      final event = AwsS3Event.fromJson(json!);

      expect(event.records![0].eventVersion, equals('2.0'));
      expect(event.records![0].eventSource, equals('aws:s3'));
      expect(event.records![0].awsRegion, equals('eu-west-1'));
      expect(event.records![0].eventTime,
          equals(DateTime.parse('1970-01-01T00:00:00.000Z')));
      expect(event.records![0].eventName, equals('ObjectCreated:Put'));
      expect(event.records![0].userIdentity!.principalId, equals('EXAMPLE'));
      expect(event.records![0].requestParameters!['sourceIPAddress'],
          equals('127.0.0.1'));
      expect(event.records![0].s3!.s3SchemaVersion, equals('1.0'));
      expect(event.records![0].s3!.configurationId, equals('testConfigRule'));
    });
  });
}
