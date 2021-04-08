import 'dart:io';

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('albevent_default', () {
    test('factory creates response with default values', () {
      final response = AwsALBResponse.fromString('SUCCESS');

      expect(response.body, equals('SUCCESS'));
      expect(response.statusCode, equals(200));
      expect(response.isBase64Encoded, equals(false));
    });

    test('factory creates a response with HTTP Status 400', () {
      final response = AwsALBResponse.fromString('SUCCESS',
          statusCode: HttpStatus.badRequest);

      expect(response.body, equals('SUCCESS'));
      expect(response.statusCode, equals(HttpStatus.badRequest));
      expect(response.isBase64Encoded, equals(false));
    });

    test('factory creates an event with html/text Header', () {
      final response = AwsALBResponse.fromString('');

      expect(response.headers,
          equals({'Content-Type': 'text/html; charset=utf-8'}));
    });

    test('factory creates an event with JSON Header', () {
      final response = AwsALBResponse.fromString('',
          headers: {'Content-Type': 'application/json'});

      expect(response.headers, equals({'Content-Type': 'application/json'}));
    });

    test('factory creates response which is base64 encoded', () {
      final response =
          AwsALBResponse.fromString('SUCCESS', isBase64Encoded: true);

      expect(response.body, equals('SUCCESS'));
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(response.isBase64Encoded, equals(true));
    });
  });
}
