import 'package:encrypt/encrypt.dart';

import '../cache_x.dart';

/// CacheX Encryption
abstract class CacheXEncrypt {
  String encryptData(String data);
  String decryptData(String data);
}

/// CacheXEncryption Implementation
class CacheXEncryptImpl implements CacheXEncrypt {
  CacheXEncryptImpl(String password) {
    key = Key.fromUtf8(password);
    encrypter = Encrypter(AES(key));
  }
  Key key;
  final iv = IV.fromLength(16);
  Encrypter encrypter;

  /// Decrypt base64 data using [encrypt package]
  @override
  String decryptData(String data) {
    try {
      final decrypted = encrypter.decrypt64(data, iv: iv);
      return decrypted;
    } catch (e) {
      throw new EncryptionException(e.toString());
    }
  }

  /// Encrypt data using [encrypt package]
  @override
  String encryptData(String data) {
    try {
      Encrypted encrypted = encrypter.encrypt(data, iv: iv);

      /// Return encrypted base64 String
      return encrypted.base64;
    } catch (e) {
      throw new EncryptionException(e.toString());
    }
  }
}
