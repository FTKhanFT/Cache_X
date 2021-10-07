part of cache_x;

class CacheXCore {
  static final CacheXCore instance = CacheXCore._ins();

  ///
  /// Initializes a new [CacheXCore] instance by [password] and [options].
  ///
  /// Use the [debug] option to turn on/off internal debug log of [CacheXCore]
  ///
  /// ```dart
  /// await CacheXCore().init(
  ///  password: password,
  ///  debug: true,
  /// );
  /// ```
  /// {@end-tool}
  ///
  ///
  /// if you are using
  /// [parse_server_sdk_flutter](https://pub.dev/packages/parse_server_sdk_flutter)
  /// in your project you can use [Cache_X](https://pub.dev/packages/cache_x) as
  /// your core store.
  /// When you initialize parse server add [CoreStoreCacheXImpl] in there.
  ///
  /// ```dart
  /// await Parse().initialize(
  ///  appId,
  ///  serverUrl,
  ///  clientKey: clientKey,
  ///  liveQueryUrl: serverUrl,
  ///  coreStore: await CoreStoreCacheXImpl.getInstance(
  ///    password: 'u0TCHVOIiEFVwOqqDo1OnLfd3Kx7yaRt',
  ///    debug: false,
  ///  ),
  ///  debug: false,
  ///  autoSendSessionId: true,
  /// );
  ///```
  /// {@end-tool}
  ///
  ///
  /// After adding the cacheX core store to parse you can use cacheX as usual as
  /// you have already initialized [Cache_X](https://pub.dev/packages/cache_x)
  ///
  ///
  /// See <https://pub.dev/packages/cache_x> for
  /// more discussion on how to use [cache_x]
  factory CacheXCore() => instance;
  CacheXCore._ins();
  CacheXWorker _worker = CacheXWorker();
  String? _password;
  bool debug = false;

  ///
  /// Initializes a new [CacheXCore] instance by [password] and [options].
  ///
  /// Use the [debug] option to turn on/off internal debug log of [CacheXCore]
  ///
  /// ```dart
  /// await CacheXCore().init(
  ///  password: password,
  ///  debug: true,
  /// );
  /// ```
  /// {@end-tool}
  ///
  ///
  /// if you are using
  /// [parse_server_sdk_flutter](https://pub.dev/packages/parse_server_sdk_flutter)
  /// in your project you can use [Cache_X](https://pub.dev/packages/cache_x) as
  /// your core store.
  /// When you initialize parse server add [CoreStoreCacheXImpl] in there.
  ///
  /// ```dart
  /// await Parse().initialize(
  ///  appId,
  ///  serverUrl,
  ///  clientKey: clientKey,
  ///  liveQueryUrl: serverUrl,
  ///  coreStore: await CoreStoreCacheXImpl.getInstance(
  ///    password: 'u0TCHVOIiEFVwOqqDo1OnLfd3Kx7yaRt',
  ///    debug: false,
  ///  ),
  ///  debug: false,
  ///  autoSendSessionId: true,
  /// );
  ///```
  /// {@end-tool}
  ///
  ///
  /// After adding the cacheX core store to parse you can use cacheX as usual as
  /// you have already initialized [Cache_X](https://pub.dev/packages/cache_x)
  ///
  ///
  /// See <https://pub.dev/packages/cache_x> for
  /// more discussion on how to use [cache_x].
  Future<CacheXCore> init({
    required String password,
    debug = false,
  }) async {
    this._password = password;
    this.debug = debug;

    /// Initializeing worker using specified password
    await _worker.init(key: password, debug: this.debug);
    if (debug) {
      DebugLog.print('Cache_X Initialized');
    }
    return instance;
  }

  bool containsKey(String key) {
    if (_password == null) {
      if (debug) {
        DebugLog.print(
            'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
      }
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    return _worker.containsKey(key);
  }

  Future<bool> remove(String key) {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    return _worker.remove(key);
  }

  Future<bool> clear() {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    return _worker.clear();
  }

  Future<bool> saveFile({
    required String key,
    required List<int> bytes,
  }) async {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    bool result = await _worker.saveFile(
      key: key,
      file: bytes,
    );
    return Future.value(result);
  }

  /// Asking CacheXWorker to Get File from cache using the key
  Uint8List? getFile({
    required String key,
  }) {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    Uint8List? result = _worker.getFile(
      key: key,
    );
    return result;
  }

  /// Send to CacheXWorker to Save string
  Future<bool> saveString({
    required String key,
    required String value,
  }) async {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    bool result = await _worker.saveData(
      key: key,
      data: value,
    );
    return Future.value(result);
  }

  /// Send to CacheXWorker to Save bool
  Future<bool> saveBool({
    required String key,
    required bool value,
  }) async {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    bool result = await _worker.saveData(
      key: key,
      data: value.toString(),
    );
    return Future.value(result);
  }

  /// Send to CacheXWorker to Save int
  Future<bool> saveInt({
    required String key,
    required int value,
  }) async {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    bool result = await _worker.saveData(
      key: key,
      data: value.toString(),
    );
    return Future.value(result);
  }

  /// Send to CacheXWorker to Save double
  Future<bool> saveDouble({
    required String key,
    required double value,
  }) async {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    bool result = await _worker.saveData(
      key: key,
      data: value.toString(),
    );
    return Future.value(result);
  }

  /// Send CacheXWorker to Save List of String
  Future<bool> saveStringList({
    required String key,
    required List<String> value,
  }) async {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    bool result = await _worker.saveStringList(
      key: key,
      data: value,
    );
    return Future.value(result);
  }

  /// Asking CacheXWorker to Get Keys from cache
  Set<String> getKeys() {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    return _worker.getKeys();
  }

  /// Asking CacheXWorker to Get string from cache using the key
  /// Provide a default value or it will return null as default
  String? getString({
    required String key,
    String? defaultValue,
  }) {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String? result = _worker.getData(
      key: key,
    );
    return result != null ? result : defaultValue;
  }

  /// Asking CacheXWorker to Get bool from cache using the key
  /// Provide a default value or it will return null as default
  bool? getBool({
    required String key,
    bool? defaultValue,
  }) {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String? result = _worker.getData(
      key: key,
    );
    if (result == 'true') {
      return true;
    } else if (result == 'false') {
      return false;
    } else {
      return defaultValue;
    }
  }

  /// Asking CacheXWorker to Get int from cache using the key
  /// Provide a default value or it will return null as default
  int? getInt({
    required String key,
    int? defaultValue,
  }) {
    int? result;
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String? stringResult = _worker.getData(
      key: key,
    );
    result = stringResult != null
        ? int.tryParse(stringResult) ?? defaultValue
        : defaultValue;
    return result;
  }

  /// Asking CacheXWorker to Get double from cache using the key
  /// Provide a default value or it will return null as default
  double? getDouble({
    required String key,
    double? defaultValue,
  }) {
    double? result;
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String? stringResult = _worker.getData(
      key: key,
    );
    result = stringResult != null
        ? double.tryParse(stringResult) ?? defaultValue
        : defaultValue;
    return result;
  }

  /// Asking CacheXWorker to Get String List from cache using the key
  /// Provide a default value or it will return null as default
  List<String>? getStringList({
    required String key,
    List<String>? defaultValue,
  }) {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    List<String>? result = _worker.getStringList(
      key: key,
    );
    return result != null ? result : defaultValue;
  }
}
