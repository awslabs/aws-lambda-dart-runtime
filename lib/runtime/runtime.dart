import 'dart:async';

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

import 'package:aws_lambda_dart_runtime/client/client.dart';
import 'package:aws_lambda_dart_runtime/runtime/event.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:aws_lambda_dart_runtime/runtime/exception.dart';

/// A function which ingests and Event and a [Context]
/// and returns a [InvocationResult]. The result is ecoded
/// by the [Runtime] and posted to the Lambda API.
typedef Handler<E> = Future Function(Context context, E event);

class _RuntimeHandler {
  final Type type;
  final dynamic handler;

  const _RuntimeHandler(this.type, this.handler) : assert(handler != null);
}

/// A Runtime manages the interface to the Lambda API.
///
/// The Runtime is designed as singleton and [Runtime.instance]
/// returns the same instance of the [Runtime] everytime.
///
/// ```dart
/// final Handler<AwsS3NotificationEvent> helloWorldHandler =
///   (context, event) async {
///    return new InvocationResult(context.requestId, "HELLO WORLD");
/// };
///
/// await Runtime.instance
///   ..registerHandler<AwsS3NotificationEvent>("hello.world", helloWorld)
///   ..invoke();
/// ```
///
/// Note: You can register an
class Runtime {
  late Client _client;

  static final Runtime _singleton = Runtime._internal();
  final Map<String, _RuntimeHandler> _handlers = {};

  factory Runtime() {
    return _singleton;
  }

  Runtime._internal() {
    _client = Client();
  }

  /// Lists the registered handlers by name.
  /// The name is a simple [String] which reflects
  /// the name of the trigger in the Lambda Execution API.
  List<String> get handlers => _handlers.keys.toList();

  /// Checks if a specific handlers has been registered
  /// with the runtime.
  bool handlerExists(String name) => _handlers.containsKey(name);

  /// Register a handler function [Handler<T>] with [name]
  /// which digests an event [T].
  Handler<E> registerHandler<E>(String name, Handler<E> handler) {
    _handlers[name] = _RuntimeHandler(E, handler);

    return handler;
  }

  /// Unregister a handler function [Handler] with [name].
  Handler? deregisterHandler(String name) =>
      _handlers.remove(name)?.handler as Handler?;

  /// Register an new event to be ingested by a handler.
  /// The type should reflect your type in your handler definition [Handler<T>].
  void registerEvent<T>(T Function(Map<String, dynamic>) func) =>
      Event.registerEvent<T>(func);

  /// Deregister an new event to be ingested by a handler.
  /// The type should reflect your type in your handler definition [Handler<T>].
  void deregisterEvent<T>() => Event.deregisterEvent<T>();

  /// Run the [Runtime] in loop and digest events that are
  /// fetched from the AWS Lambda API Interface. The events are processed
  /// sequentially and are fetched from the AWS Lambda API Interface.
  ///
  /// If the invocation of an event was successful the function
  /// sends the [InvocationResult] via [_client.postInvocationResponse(result)] to the API.
  /// If there is an error during the execution. The exception gets caught
  /// and the error is posted via [_client.postInvocationError(err)] to the API.
  void invoke() async {
    while (true) {
      await _handleInvocation(await _client.getNextInvocation());
    }
  }

  Future<void> _handleInvocation(NextInvocation nextInvocation) async {
    try {
      // creating the new context
      final context = Context.fromNextInvocation(nextInvocation);

      final func = _handlers[context.handler];
      if (func == null) {
        throw RuntimeException(
            'No handler with name "${context.handler}" registered in runtime!');
      }
      final event = Event.fromHandler(func.type, nextInvocation.response);
      final result = await func.handler(context, event);

      await _client.postInvocationResponse(context.requestId, result);
    } catch (error, stacktrace) {
      await _client.postInvocationError(
          nextInvocation.requestId, InvocationError(error, stacktrace));
    }
  }
}
