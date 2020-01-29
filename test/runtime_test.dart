import "package:test/test.dart";

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

void main() {
  group('runtime', () {
    test("instance is created without error", () {
      expect(() => Runtime(), returnsNormally);
    });

    test("instance is same accross invocation", () async {
      final runtime = await Runtime();

      expect(runtime, await Runtime());
    });

    test("successfully add a handler to runtime", () async {
      final runtime = await Runtime();

      final Handler<AwsS3Event> testHandler = (context, event) async {
        return new InvocationResult(context.requestId, "HELLO WORLD");
      };

      final addHandler = runtime.registerHandler("test.handler", testHandler);

      expect(runtime.handlerExists("test.handler"), equals(true));
      expect(addHandler, equals(testHandler));
    });

    test("successfully deregister a handler to runtime", () async {
      final runtime = await Runtime();

      final Handler<AwsS3Event> testHandler = (context, event) async {
        return new InvocationResult(context.requestId, "HELLO WORLD");
      };

      runtime.registerHandler("test.handler", testHandler);
      final removedHandler =
          runtime.deregisterHandler<AwsS3Event>("test.handler");

      expect(runtime.handlerExists("test.handler"), equals(false));
      expect(removedHandler, equals(testHandler));
    });
  });
}
