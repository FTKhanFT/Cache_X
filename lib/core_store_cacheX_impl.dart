import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:cache_x/cache_x.dart';

class CoreStoreCacheXImpl extends CoreStore {
  static CoreStoreCacheXImpl? _instance;

  static Future<CoreStoreCacheXImpl> getInstance({String? password}) async {
    password ??= 'flutter_sdk';
    if (_instance == null) {
      await CacheXCore().init(password: password);
    }
    return _instance!;
  }

  @override
  Future clear() {
    return CacheXCore.instance.clear();
  }

  @override
  Future<bool> containsKey(String key) async {
    return CacheXCore.instance.containsKey(key);
  }

  @override
  Future get(String key) async {
    return CacheXCore.instance.getString(key: key, defaultValue: null);
  }

  @override
  Future<bool?> getBool(String key) async {
    return CacheXCore.instance.getBool(
      key: key,
      defaultValue: null,
    );
  }

  @override
  Future<double?> getDouble(String key) async {
    return CacheXCore.instance.getDouble(key: key, defaultValue: null);
  }

  @override
  Future<int?> getInt(String key) async {
    return CacheXCore.instance.getInt(key: key, defaultValue: null);
  }

  @override
  Future<String?> getString(String key) async {
    return CacheXCore.instance.getString(key: key, defaultValue: null);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    return CacheXCore.instance.getStringList(key: key, defaultValue: null);
  }

  @override
  Future remove(String key) {
    return CacheXCore.instance.remove(key);
  }

  @override
  Future setBool(String key, bool value) {
    return CacheXCore.instance.saveBool(key: key, value: value);
  }

  @override
  Future setDouble(String key, double value) {
    return CacheXCore.instance.saveDouble(key: key, value: value);
  }

  @override
  Future setInt(String key, int value) {
    return CacheXCore.instance.saveInt(key: key, value: value);
  }

  @override
  Future setString(String key, String value) {
    return CacheXCore.instance.saveString(key: key, value: value);
  }

  @override
  Future setStringList(String key, List<String> values) {
    return CacheXCore.instance.saveStringList(key: key, value: values);
  }
}
