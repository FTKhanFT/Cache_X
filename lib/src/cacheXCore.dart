part of cache_x;

class CacheXCore {
  static final CacheXCore instance = CacheXCore._ins();
  factory CacheXCore() => instance;
  CacheXCore._ins();
  CacheXWorker _worker;
  String _password;

  /// Initialize th CacheXCore
  init({
    @required String password,
  }) async {
    this._password = password;

    /// Initializeing worker using specified password
    _worker = CacheXWorker(
      key: password,
    );
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
  Future<Set<String>> getKeys() async {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    Set<String> result = await _worker.getKeys();
    return Future.value(result);
  }

  /// Asking CacheXWorker to Get string from cache using the key
  Future<String> getString({
    @required String key,
  }) async {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String result = await _worker.getData(
      key: key,
    );
    return Future.value(result);
  }

  /// Asking CacheXWorker to Get bool from cache using the key
  Future<bool> getBool({
    @required String key,
  }) async {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String result = await _worker.getData(
      key: key,
    );
    if (result == 'true') {
      return Future.value(true);
    } else if (result == 'false') {
      return Future.value(false);
    } else {
      throw new CacheXException('The data for key: $key is not Type of bool');
    }
  }

  /// Asking CacheXWorker to Get int from cache using the key
  Future<int> getInt({
    @required String key,
  }) async {
    int result;
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String stringResult = await _worker.getData(
      key: key,
    );
    try {
      result = int.tryParse(stringResult);
      return Future.value(result);
    } catch (e) {
      throw new CacheXException('The data for key: $key is not Type of int');
    }
  }

  /// Asking CacheXWorker to Get double from cache using the key
  Future<double> getDouble({
    @required String key,
  }) async {
    double result;
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    String stringResult = await _worker.getData(
      key: key,
    );
    try {
      result = double.tryParse(stringResult);
      return Future.value(result);
    } catch (e) {
      throw new CacheXException('The data for key: $key is not Type of double');
    }
  }

  /// Asking CacheXWorker to Get String List from cache using the key
  Future<List<String>> getStringList({
    @required String key,
  }) async {
    if (_password == null) {
      throw new CacheXException(
          'Please initialize the CacheXCore before using it. e.g: await CacheXCore().init(password: password)');
    }
    List<String> result = await _worker.getStringList(
      key: key,
    );
    return Future.value(result);
  }
}
