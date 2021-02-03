import 'package:shared_preferences/shared_preferences.dart';

class CacheStorage {
  static final CacheStorage _instance = CacheStorage._ins();
  factory CacheStorage() => _instance;
  CacheStorage._ins();

  SharedPreferences _preferance;

  /// Initializing [SharedPreferance]
  init() async {
    _preferance = await SharedPreferences.getInstance();
  }

  /// Get data from [SharedPreferences]
  Future<String> getData(String key) async {
    return Future.value(_preferance.getString(key));
  }

  /// Save data to [SharedPreferences]
  Future<bool> saveData(String key, String data) async {
    return Future.value(_preferance.setString(key, data));
  }
}
