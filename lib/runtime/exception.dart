/// An exception thrown when there is an error in the runtime.
class RuntimeException implements Exception {
  const RuntimeException(this.cause);

  /// Explains the reason why there is an exception thrown
  /// in the runtime.
  final String cause;

  @override
  String toString() => 'RuntimeException: $cause';
}
