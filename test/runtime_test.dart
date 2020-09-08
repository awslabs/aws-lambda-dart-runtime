import 'package:test/test.dart';

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

void main() {
  group('runtime', () {
    test('instance is created without error', () {
      expect(() => Runtime(), returnsNormally);
    });

    test('instance is same across invocation', () async {
      final runtime = await Runtime();

      expect(runtime, await Runtime());
    });

    test('successfully add a handler to runtime', () async {
      final runtime = await Runtime();

      final Handler testHandler = (context, event) async {
        return null;
      };

      final addHandler = runtime.registerHandler('test.handler', testHandler);

      expect(runtime.handlerExists('test.handler'), equals(true));
      expect(addHandler, equals(testHandler));
    });

    test('successfully deregister a handler to runtime', () async {
      final runtime = await Runtime();

      final testHandler = (context, event) async {
        return null;
      };

      runtime.registerHandler('test.handler', testHandler);
      final removedHandler = runtime.deregisterHandler('test.handler');

      expect(runtime.handlerExists('test.handler'), equals(false));
      expect(removedHandler, equals(testHandler));
    });
  });
}
