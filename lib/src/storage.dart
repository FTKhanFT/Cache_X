import 'package:shared_preferences/shared_preferences.dart';

class CacheStorage {
  static final CacheStorage _instance = CacheStorage._ins();
  factory CacheStorage() => _instance;
  CacheStorage._ins();

  init() async {
    if (_preferance == null) {
      this._preferance = await SharedPreferences.getInstance();
    }
  }

  SharedPreferences _preferance;

  /// Get keys
  Set<String> getKeys() {
    return _preferance.getKeys();
  }

  /// Get String from [SharedPreferences]
  String getString(String key) {
    return _preferance.getString(key);
  }

  /// Get String List from [SharedPreferences]
  List<String> getStringList(String key) {
    return _preferance.getStringList(key);
  }

  /// Save String to [SharedPreferences]
  Future<bool> saveString(String key, String data) {
    return _preferance.setString(key, data);
  }

  /// Save String List to [SharedPreferences]
  Future<bool> saveStringList(String key, List<String> data) {
    return _preferance.setStringList(key, data);
  }
}
