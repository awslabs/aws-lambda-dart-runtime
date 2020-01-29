import 'dart:io';

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import "package:test/test.dart";

void main() {
  group("apigateway_default", () {
    test("factory creates event with default values", () {
      final response = AwsApiGatewayResponse.fromJson({});

      expect(response.body, equals({}.toString()));
      expect(response.statusCode, equals(200));
      expect(response.isBase64Encoded, equals(false));
    });

    test("factory creates an event with HTTP Status 400", () {
      final response =
          AwsApiGatewayResponse.fromJson({}, statusCode: HttpStatus.badRequest);

      expect(response.body, equals({}.toString()));
      expect(response.statusCode, equals(HttpStatus.badRequest));
      expect(response.isBase64Encoded, equals(false));
    });

    test("factory creates an event with is based 64 encoded", () {
      final response =
          AwsApiGatewayResponse.fromJson({}, isBase64Encoded: true);

      expect(response.body, equals({}.toString()));
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(response.isBase64Encoded, equals(true));
    });
  });
}
