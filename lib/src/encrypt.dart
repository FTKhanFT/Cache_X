import 'package:cache_x/src/exception.dart';
import 'package:encrypt/encrypt.dart';

abstract class CacheXEncrypt {
  Future<String> encryptData(String data);
  Future<String> decryptData(String data);
}

/// CAcheXEncryption Implementation
class CacheXEncryptImpl implements CacheXEncrypt {
  CacheXEncryptImpl(String password) {
    key = Key.fromUtf8(password);
    encrypter = Encrypter(AES(key));
  }
  Key key;
  final iv = IV.fromLength(16);
  Encrypter encrypter;

  @override
  Future<String> decryptData(String data) {
    try {
      /// Decrypt base64 data using [encrypt package]
      final decrypted = encrypter.decrypt64(data, iv: iv);
      return Future.value(decrypted);
    } catch (e) {
      throw new EncryptionException(e.toString());
    }
  }

  @override
  Future<String> encryptData(String data) {
    try {
      /// Encrypt data using [encrypt package]
      Encrypted encrypted = encrypter.encrypt(data, iv: iv);

      /// Return encrypted base64 String
      return Future.value(encrypted.base64);
    } catch (e) {
      throw new EncryptionException(e.toString());
    }
  }
}
