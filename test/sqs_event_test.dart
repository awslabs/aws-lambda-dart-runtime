import 'dart:convert';
import 'dart:io' show File;

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:test/test.dart';

final file = 'data/sqs_event.json';

final String contents = File(file).readAsStringSync();
final json = jsonDecode(contents) as Map<String, dynamic>?;

void main() {
  group('sqs_default', () {
    test('json got parsed and creates an event', () async {
      final event = AwsSQSEvent.fromJson(json!);

      expect(event.records!.length, equals(1));
      expect(event.records![0].md5OfBody,
          equals('7b270e59b47ff90a553787216d55d91d'));
      expect(event.records![0].eventSource, equals('aws:sqs'));
      expect(event.records![0].eventSourceARN,
          equals('arn:aws:sqs:eu-west-1:123456789012:MyQueue'));
      expect(event.records![0].awsRegion, equals('eu-west-1'));
      expect(event.records![0].body, equals('Hello from SQS!'));
      expect(event.records![0].messageId,
          equals('19dd0b57-b21e-4ac1-bd88-01bbb068cb78'));
      expect(event.records![0].receiptHandle, equals('MessageReceiptHandle'));
    });
  });
}
