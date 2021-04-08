import 'package:test/test.dart';

import 'package:aws_lambda_dart_runtime/client/client.dart';

void main() {
  group('invocation', () {
    test('invocation result gets populated', () {
      final result = InvocationResult('1234567890', 'SUCCESS');

      expect(result.requestId, '1234567890');
      expect(result.body, 'SUCCESS');
    });

    test('invocation error gets populated', () {
      final stateError = StateError('foo');
      final invocationError =
          InvocationError(stateError, StackTrace.fromString(''));

      expect(invocationError.error, stateError);
    });
  });
}
