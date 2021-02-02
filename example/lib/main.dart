import 'package:cache_x/cache_x.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize 128byte password (16 Charecter)
  String password = 'CBoaDQIQAgceGg8d';

  // Initialize CacheX with the password
  await CacheXCore().init(password);

  // Do your apps essential works

  // Then anywhere in your app use it to save string
  print(await CacheXCore.instance.saveData('ft1', 'Tanvir'));
  // Get String
  print(await CacheXCore.instance.getData('ft1'));
}
