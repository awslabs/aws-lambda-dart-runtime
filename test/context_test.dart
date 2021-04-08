import 'package:http/http.dart';
import 'package:test/test.dart';

import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:aws_lambda_dart_runtime/client/client.dart';

void main() {
  group('context', () {
    test('Context gets initialized with a Platform.environment', () async {
      final environment = {
        '_HANDLER': 'foo',
        'AWS_LAMBDA_FUNCTION_NAME': 'bar',
        'AWS_LAMBDA_FUNCTION_VERSION': '1',
        'AWS_LAMBDA_LOG_GROUP_NAME': 'foo',
        'AWS_LAMBDA_LOG_STREAM_NAME': 'foo',
        'AWS_LAMBDA_FUNCTION_MEMORY_SIZE': '128',
        'AWS_REGION': 'eu-west-1',
        'AWS_EXECUTION_ENV': 'foo',
        'AWS_ACCESS_KEY_ID': 'secret',
        'AWS_SECRET_ACCESS_KEY': 'key',
        'AWS_SESSION_TOKEN': '1234567890'
      };

      final nextInvocation =
          await NextInvocation.fromResponse(Response('{}', 200));

      final ctx = Context.fromNextInvocation(nextInvocation);

      expect(ctx.handler, environment['_HANDLER']);
      expect(ctx.functionName, environment['AWS_LAMBDA_FUNCTION_NAME']);
      expect(ctx.functionVersion, environment['AWS_LAMBDA_FUNCTION_VERSION']);
      expect(ctx.logGroupName, environment['AWS_LAMBDA_LOG_GROUP_NAME']);
      expect(ctx.logStreamName, environment['AWS_LAMBDA_LOG_STREAM_NAME']);
      expect(ctx.functionMemorySize,
          environment['AWS_LAMBDA_FUNCTION_MEMORY_SIZE']);
      expect(ctx.region, environment['AWS_REGION']);
      expect(ctx.executionEnv, environment['AWS_EXECUTION_ENV']);
      expect(ctx.accessKey, environment['AWS_ACCESS_KEY_ID']);
      expect(ctx.secretAccessKey, environment['AWS_SECRET_ACCESS_KEY']);
      expect(ctx.sessionToken, environment['AWS_SESSION_TOKEN']);
    });
  }, skip: 'the tests are not quite ready');
}
