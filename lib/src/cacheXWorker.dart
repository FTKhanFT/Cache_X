import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cache_x/src/encrypt.dart';
import 'package:cache_x/src/storage.dart';
import 'package:flutter/material.dart';

import '../cache_x.dart';

class CacheXWorker {
  String? key;
  bool debug = false;
  init({
    required String key,
    bool debug = false,
  }) async {
    this.debug = debug;
    this._encrypt = CacheXEncryptImpl(key, debug: this.debug);
    await _storage.init(debug: this.debug);
    if (debug) {
      DebugLog.print('Cache_X worker Initialized');
    }
  }

  CacheStorage _storage = CacheStorage();
  late CacheXEncrypt _encrypt;

  Future<bool> saveFile({
    required String key,
    required List<int> file,
  }) async {
    try {
      String data = base64Encode(file);
      if (debug) {
        DebugLog.print('Encoded File');
      }

      /// Getting encrypted data from CacheXEncryption
      String encryptedData = _encrypt.encryptData(data);
      if (debug) {
        DebugLog.print('Encrypted File');
      }

      /// Sending data to CacheStorage to save
      bool result = await _storage.saveString(key, encryptedData);
      if (debug) {
        DebugLog.print('File Saved: $result');
      }
      return Future.value(result);
    } catch (e) {
      if (debug) {
        DebugLog.print(
          e.toString(),
          foreground: Colors.red,
        );
      }
      throw new StorageException(e.toString());
    }
  }

  Uint8List? getFile({
    required String key,
  }) {
    try {
      /// getting data from [CacheXStorage]
      String? encryptedData = _storage.getString(key);

      /// Getting decrypted data from [cacheXEncryption]
      String? decryptedData =
          encryptedData != null ? _encrypt.decryptData(encryptedData) : null;
      if (decryptedData == null) {
        return null;
      }
      if (debug) {
        DebugLog.print('Decrypted File');
      }
      Uint8List decodedFile = base64Decode(decryptedData);
      if (debug) {
        DebugLog.print('Retrived File: true');
      }
      return decodedFile;
    } catch (e) {
      if (debug) {
        DebugLog.print(
          e.toString(),
          foreground: Colors.red,
        );
      }
      throw new StorageException(e.toString());
    }
  }

  /// Encrypting and saving data
  Future<bool> saveData({
    required String key,
    required String data,
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
    required String key,
    required List<String> data,
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

  bool containsKey(String key) => _storage.containsKey(key);
  Future<bool> remove(String key) => _storage.remove(key);
  Future<bool> clear() => _storage.clear();

  /// Getting data and decrypting
  String? getData({
    required String key,
  }) {
    try {
      /// getting data from [CacheXStorage]
      String? data = _storage.getString(key);

      /// Getting decrypted data from [cacheXEncryption]
      String? result = data != null ? _encrypt.decryptData(data) : null;
      return result;
    } catch (e) {
      throw new StorageException(e.toString());
    }
  }

  /// Getting lis data and decrypting
  List<String>? getStringList({
    required String key,
  }) {
    try {
      /// getting data from [CacheXStorage]
      List<String>? data = _storage.getStringList(key);

      /// Getting decrypted data from [cacheXEncryption]
      List<String>? result;
      if (data != null) {
        result = <String>[];
        data.forEach((element) {
          result!.add(_encrypt.decryptData(element));
        });
      }
      return result;
    } catch (e) {
      throw new StorageException(e.toString());
    }
  }
}
