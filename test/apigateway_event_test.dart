import 'dart:io';
import 'dart:io' show File;
import 'dart:convert';

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:test/test.dart';

final file = 'data/apigateway_event.json';

final String contents = File(file).readAsStringSync();
final Map<String, dynamic>? json =
    jsonDecode(contents) as Map<String, dynamic>?;

void main() {
  group('apigateway_default', () {
    test('json got parsed and creates an event', () async {
      final event = AwsApiGatewayEvent.fromJson(json!);

      expect(event.body, equals(jsonEncode({'foo': 'bar'})));
      expect(event.path, equals('/test/hello'));
      expect(event.headers!.acceptEncoding,
          equals('gzip, deflate, lzma, sdch, br'));
      expect(event.requestContext!.httpMethod, equals('POST'));
      expect(event.requestContext!.accountId, equals('123456789012'));
      expect(event.requestContext!.requestId,
          equals('41b45ea3-70b5-11e6-b7bd-69b5aaebc7d9'));
      expect(event.queryStringParameters, equals({'name': 'me'}));
      expect(event.requestContext!.resourcePath, equals('/{proxy+}'));
      expect(event.headers!.raw['Accept-Encoding'],
          equals('gzip, deflate, lzma, sdch, br'));
    });
    test('factory creates event with default values', () {
      final response = AwsApiGatewayResponse.fromJson({});

      expect(response.body, equals({}.toString()));
      expect(response.statusCode, equals(200));
      expect(response.isBase64Encoded, equals(false));
    });

    test('factory creates an event with HTTP Status 400', () {
      final response =
          AwsApiGatewayResponse.fromJson({}, statusCode: HttpStatus.badRequest);

      expect(response.body, equals({}.toString()));
      expect(response.statusCode, equals(HttpStatus.badRequest));
      expect(response.isBase64Encoded, equals(false));
    });

    test('factory creates an event with JSON Header', () {
      final response = AwsApiGatewayResponse.fromJson({});

      expect(response.headers, equals({'Content-Type': 'application/json'}));
    });

    test('factory creates an event with text/html Header', () {
      final response = AwsApiGatewayResponse.fromJson({},
          headers: {'Content-Type': 'text/html; charset=utf-8'});

      expect(response.headers,
          equals({'Content-Type': 'text/html; charset=utf-8'}));
    });

    test('factory creates an event with is based 64 encoded', () {
      final response =
          AwsApiGatewayResponse.fromJson({}, isBase64Encoded: true);

      expect(response.body, equals({}.toString()));
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(response.isBase64Encoded, equals(true));
    });
  });
}
