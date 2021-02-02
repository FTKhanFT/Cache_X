/// Exception Related to ChacheX Storage
class StorageException implements Exception {
  final dynamic message;
  StorageException([this.message]);
  String toString() {
    Object message = this.message;
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}

/// Exception related to CacheX Encryption
class EncryptionException implements Exception {
  final dynamic message;
  EncryptionException([this.message]);
  String toString() {
    Object message = this.message;
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}
