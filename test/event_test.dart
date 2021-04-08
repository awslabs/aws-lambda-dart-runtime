import 'package:test/test.dart';

import 'package:aws_lambda_dart_runtime/runtime/event.dart';

class CustomTestEvent extends Event {
  factory CustomTestEvent.fromJson(Map<String, dynamic> json) {
    return CustomTestEvent();
  }

  const CustomTestEvent();
}

void main() {
  group('runtime', () {
    test('Custom event is add to the events', () {
      Event.registerEvent<CustomTestEvent>(
          (Map<String, dynamic>? json) => CustomTestEvent.fromJson({}));

      expect(Event.exists<CustomTestEvent>(), true);
    });

    test('Custom event is deregistered', () {
      Event.registerEvent<CustomTestEvent>(
          (Map<String, dynamic>? json) => CustomTestEvent.fromJson({}));

      Event.deregisterEvent<CustomTestEvent>();

      expect(Event.exists<CustomTestEvent>(), false);
    });
  });
}
