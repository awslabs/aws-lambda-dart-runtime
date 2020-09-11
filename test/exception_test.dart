import 'package:test/test.dart';

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

void main() {
  group('runtime exception', () {
    test('return the cause a string', () {
      final exception = RuntimeException('missing handler');
      expect(exception.toString(), equals('RuntimeException: missing handler'));
    });

    test('catch exception with cause', () {
      try {
        throw RuntimeException('missing handler');
      } on RuntimeException catch (e) {
        expect(e.cause, 'missing handler');
        return;
      }
    });
  });
}
