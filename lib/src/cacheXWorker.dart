import 'package:cache_x/src/encrypt.dart';
import 'package:cache_x/src/exception.dart';
import 'package:cache_x/src/storage.dart';

class CacheXWorker {
  CacheXWorker(String key) {
    /// Initializeing the CacheXEncryption using user specified [password/Key]
    _encrypt = CacheXEncryptImpl(key);
  }
  CacheStorage _storage = CacheStorage();
  CacheXEncrypt _encrypt;

  Future<bool> saveData(String key, String data) async {
    try {
      /// Initializing Storage if it's not initialized.
      await _storage.init();

      /// Getting encrypted data from CacheXEncryption
      String encryptedData = await _encrypt.encryptData(data);

      /// Sending data to CacheStorage to save
      bool result = await _storage.saveData(key, encryptedData);
      return Future.value(result);
    } catch (e) {
      throw new StorageException(e.toString());
    }
  }

  Future<String> getData(String key) async {
    try {
      /// Initializing Storage if it's not initialized.
      await _storage.init();

      /// getting data from [CacheXStorage]
      String data = await _storage.getData(key);

      /// Getting decrypted data from [cacheXEncryption]
      String result = await _encrypt.decryptData(data);
      return Future.value(result);
    } catch (e) {
      throw new StorageException(e.toString());
    }
  }
}
