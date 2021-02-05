part of cache_x;

class CacheXCore {
  static final CacheXCore instance = CacheXCore._ins();
  factory CacheXCore() => instance;
  CacheXCore._ins();
  CacheXWorker _worker = CacheXWorker();
  String _password;

  /// Initialize th CacheXCore
  init({
    @required String password,
  }) async {
    this._password = password;

    /// Initializeing worker using specified password
    await _worker.init(key: password);
  }

  /// Send to CacheXWorker to Save string
  Future<bool> saveString({
    @required String key,
    @required String value,
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
    @required String key,
    @required bool value,
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
    @required String key,
    @required int value,
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
    @required String key,
    @required double value,
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
    @required String key,
    @required List<String> value,
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
  String getString({
    @required String key,
    String defaultValue,
  }) {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String result = _worker.getData(
      key: key,
    );
    return result != null ? result : defaultValue;
  }

  /// Asking CacheXWorker to Get bool from cache using the key
  /// Provide a default value or it will return null as default
  bool getBool({
    @required String key,
    bool defaultValue,
  }) {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String result = _worker.getData(
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
  int getInt({
    @required String key,
    int defaultValue,
  }) {
    int result;
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String stringResult = _worker.getData(
      key: key,
    );
    try {
      result = int.tryParse(stringResult);
      return result;
    } catch (e) {
      return defaultValue;
    }
  }

  /// Asking CacheXWorker to Get double from cache using the key
  /// Provide a default value or it will return null as default
  double getDouble({
    @required String key,
    double defaultValue,
  }) {
    double result;
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String stringResult = _worker.getData(
      key: key,
    );
    try {
      result = double.tryParse(stringResult);
      return result;
    } catch (e) {
      return defaultValue;
    }
  }

  /// Asking CacheXWorker to Get String List from cache using the key
  /// Provide a default value or it will return null as default
  List<String> getStringList({
    @required String key,
    List<String> defaultValue,
  }) {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    List<String> result = _worker.getStringList(
      key: key,
    );
    return result.isEmpty ? defaultValue : result;
  }
}
