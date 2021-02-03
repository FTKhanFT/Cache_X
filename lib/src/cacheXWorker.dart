import 'package:cache_x/src/encrypt.dart';
import 'package:cache_x/src/storage.dart';
import 'package:flutter/material.dart';

import '../cache_x.dart';

class CacheXWorker {
  static final CacheXWorker _instance = CacheXWorker._ins();
  factory CacheXWorker() => _instance;
  CacheXWorker._ins();
  String key;
  init({@required String key}) async {
    _encrypt = CacheXEncryptImpl(
      key,
    );
    await _storage.init();
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
      String encryptedData = _encrypt.encryptData(data);

      /// Sending data to CacheStorage to save
      bool result = await _storage.saveString(key, encryptedData);
      return Future.value(result);
    } catch (e) {
      throw new StorageException(e.toString());
    }
  }

  /// Encrypting and saving data
  Future<bool> saveStringList({
    @required String key,
    @required List<String> data,
  }) async {
    try {
      List<String> encryptedData = <String>[];
      data.forEach((element) {
        /// Getting encrypted data from CacheXEncryption
        final str = _encrypt.encryptData(element);
        encryptedData.add(str);
      });

      /// Sending data to CacheStorage to save
      bool result = await _storage.saveStringList(key, encryptedData);
      return Future.value(result);
    } catch (e) {
      throw new StorageException(e.toString());
    }
  }

  /// Getting keys
  Set<String> getKeys() {
    try {
      /// getting data from [CacheXStorage]
      Set<String> result = _storage.getKeys();
      return result;
    } catch (e) {
      throw new StorageException(e.toString());
    }
  }

  /// Getting data and decrypting
  String getData({
    @required String key,
  }) {
    try {
      /// getting data from [CacheXStorage]
      String data = _storage.getString(key);

      /// Getting decrypted data from [cacheXEncryption]
      String result = _encrypt.decryptData(data);
      return result;
    } catch (e) {
      throw new StorageException(e.toString());
    }
  }

  /// Getting lis data and decrypting
  List<String> getStringList({
    @required String key,
  }) {
    try {
      /// getting data from [CacheXStorage]
      List<String> data = _storage.getStringList(key);

      /// Getting decrypted data from [cacheXEncryption]
      List<String> result = <String>[];
      data.forEach((element) {
        result.add(_encrypt.decryptData(element));
      });
      return result;
    } catch (e) {
      throw new StorageException(e.toString());
    }
  }
}
