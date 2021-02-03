import 'package:shared_preferences/shared_preferences.dart';

class CacheStorage {
  static final CacheStorage _instance = CacheStorage._ins();
  factory CacheStorage() => _instance;
  CacheStorage._ins();

  SharedPreferences _preferance;

  /// Get data from [SharedPreferences]
  Future<String> getData(String key) async {
    if (_preferance == null) {
      this._preferance = await SharedPreferences.getInstance();
    }
    return Future.value(_preferance.getString(key));
  }

  /// Save data to [SharedPreferences]
  Future<bool> saveData(String key, String data) async {
    if (_preferance == null) {
      this._preferance = await SharedPreferences.getInstance();
    }
    return Future.value(_preferance.setString(key, data));
  }
}
