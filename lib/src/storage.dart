import 'package:shared_preferences/shared_preferences.dart';

class CacheStorage {
  static final CacheStorage _instance = CacheStorage._ins();
  factory CacheStorage() => _instance;
  CacheStorage._ins();

  SharedPreferences _preferance;

  /// Get keys
  Future<Set<String>> getKeys() async {
    if (_preferance == null) {
      this._preferance = await SharedPreferences.getInstance();
    }
    return Future.value(_preferance.getKeys());
  }

  /// Get String from [SharedPreferences]
  Future<String> getString(String key) async {
    if (_preferance == null) {
      this._preferance = await SharedPreferences.getInstance();
    }
    return Future.value(_preferance.getString(key));
  }

  /// Get String List from [SharedPreferences]
  Future<List<String>> getStringList(String key) async {
    if (_preferance == null) {
      this._preferance = await SharedPreferences.getInstance();
    }
    return Future.value(_preferance.getStringList(key));
  }

  /// Save String to [SharedPreferences]
  Future<bool> saveString(String key, String data) async {
    if (_preferance == null) {
      this._preferance = await SharedPreferences.getInstance();
    }
    return Future.value(_preferance.setString(key, data));
  }

  /// Save String List to [SharedPreferences]
  Future<bool> saveStringList(String key, List<String> data) async {
    if (_preferance == null) {
      this._preferance = await SharedPreferences.getInstance();
    }
    return Future.value(_preferance.setStringList(key, data));
  }
}
