import 'package:cache_x/cache_x.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheStorage {
  bool debug = false;
  init({bool debug = false}) async {
    this.debug = debug;
    if (_preferance == null) {
      this._preferance = await SharedPreferences.getInstance();
      if (debug) {
        DebugLog.print('Cache_X Storage Initialized');
      }
    }
  }

  SharedPreferences? _preferance;

  /// Get keys
  Set<String> getKeys() {
    return _preferance!.getKeys();
  }

  Object? get(String key) => _preferance!.get(key);

  bool containsKey(String key) => _preferance!.containsKey(key);

  Future<bool> remove(String key) => _preferance!.remove(key);
  Future<bool> clear() => _preferance!.clear();

  /// Get String from [SharedPreferences]
  String? getString(String key) {
    return _preferance!.getString(key);
  }

  /// Get String List from [SharedPreferences]
  List<String>? getStringList(String key) {
    return _preferance!.getStringList(key);
  }

  /// Save String to [SharedPreferences]
  Future<bool> saveString(String key, String data) {
    return _preferance!.setString(key, data);
  }

  /// Save String List to [SharedPreferences]
  Future<bool> saveStringList(String key, List<String> data) {
    return _preferance!.setStringList(key, data);
  }
}
