import 'package:cache_x/cache_x.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize password
  // Password length must be 128/192/256 bits
  // You can use the password of 16 character,24 character or 32 character.
  String password = 'CBoaDQIQAgceGg8dFAkMDBEOECEZCxg=';

  // Initialize CacheX with the password
  final cacheX = CacheXCore();
  await cacheX.init(password: password);

  // Setting values
  await cacheX.saveBool(key: '1', value: true);
  await cacheX.saveDouble(key: '2', value: 10.5);
  await cacheX.saveInt(key: '3', value: 30);
  await cacheX.saveString(key: '4', value: 'String');
  await cacheX.saveStringList(
    key: '5',
    value: [
      'String1',
      'String2',
      'String3',
    ],
  );

  // Getting values
  print(await cacheX.getBool(key: '1'));
  print(await cacheX.getDouble(key: '2'));
  print(await cacheX.getInt(key: '3'));
  print(await cacheX.getString(key: '4'));
  print(await cacheX.getStringList(key: '5'));
  print(await cacheX.getKeys());
}
