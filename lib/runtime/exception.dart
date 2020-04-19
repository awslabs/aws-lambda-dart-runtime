class RuntimeException implements Exception {
  String cause;
  RuntimeException(this.cause);

  String toString() => "RuntimeException: $cause";
}