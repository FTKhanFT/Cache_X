import 'package:cache_x/src/encrypt.dart';
import 'package:cache_x/src/storage.dart';
import 'package:flutter/material.dart';

import '../cache_x.dart';

class CacheXWorker {
  CacheXWorker({
    @required String key,
  }) {
    /// Initializeing the CacheXEncryption using user specified [password/Key]
    _encrypt = CacheXEncryptImpl(
      key,
    );
  }
  CacheStorage _storage = CacheStorage();
  CacheXEncrypt _encrypt;

  /// Encrypting and saving data
  Future<bool> saveData({
    @required String key,
    @required String data,
  }) async {
    try {
      /// Getting encrypted data from CacheXEncryption
      String encryptedData = await _encrypt.encryptData(data);

      /// Sending data to CacheStorage to save
      bool result = await _storage.saveData(key, encryptedData);
      return Future.value(result);
    } catch (e) {
      throw new StorageException(e.toString());
    }
  }

  /// Getting data and decrypting
  Future<String> getData({
    @required String key,
  }) async {
    try {
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
