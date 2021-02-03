part of cache_x;

/// Exception Related to ChacheX Storage
class StorageException implements Exception {
  final dynamic message;
  StorageException([this.message]);
  String toString() {
    Object message = this.message;
    if (message == null) return "StorageException";
    return "StorageException: $message";
  }
}

/// Exception related to CacheX Encryption
class EncryptionException implements Exception {
  final dynamic message;
  EncryptionException([this.message]);
  String toString() {
    Object message = this.message;
    if (message == null) return "EncryptionException";
    return "EncryptionException: $message";
  }
}

/// Exception related to CacheX Core
class CacheXException implements Exception {
  final dynamic message;
  CacheXException([this.message]);
  String toString() {
    Object message = this.message;
    if (message == null) return "EncryptionException";
    return "CacheXException: $message";
  }
}
