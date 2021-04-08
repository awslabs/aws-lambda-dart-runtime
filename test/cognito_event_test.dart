import 'dart:convert';
import 'dart:io' show File;

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:test/test.dart';

final file = 'data/cognito_event.json';

final String contents = File(file).readAsStringSync();
final json = jsonDecode(contents) as Map<String, dynamic>?;

void main() {
  group('cognito_default', () {
    test('json got parsed and creates an event', () async {
      final event = AwsCognitoEvent.fromJson(json!);

      expect(event.version, equals(1));
      expect(event.userPoolId, equals('1234567'));
      expect(event.userName, equals('foo'));
      expect(event.response!.smsMessage, equals('foo'));
      expect(event.response!.emailSubject, equals('foo'));
      expect(event.response!.emailMessage, equals('bar'));
    });
  });
}
