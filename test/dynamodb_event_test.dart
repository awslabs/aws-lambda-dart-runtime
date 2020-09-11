import 'dart:convert';
import 'dart:io' show File;

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:test/test.dart';

final file = 'data/dynamodb_event.json';

final String contents = File(file).readAsStringSync();
final json = jsonDecode(contents) as Map<String, dynamic>;

void main() {
  group('dynamodb_default', () {
    test('json got parsed and creates an event', () async {
      final event = AwsDynamoDBUpdateEvent.fromJson(json);

      expect(event.records.length, equals(1));
    });
  });
}
