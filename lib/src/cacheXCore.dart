part of cache_x;

class CacheXCore {
  static final CacheXCore instance = CacheXCore._ins();
  factory CacheXCore() => instance;
  CacheXCore._ins();
  CacheXWorker _worker;

  /// Initialize th CacheXCore
  init({
    @required String password,
  }) async {
    /// Initializeing worker using specified password
    _worker = CacheXWorker(
      key: password,
    );
  }

  /// Send data to CacheXWorker to Save data
  Future<bool> saveData({
    @required String key,
    @required String value,
  }) async {
    bool result = await _worker.saveData(
      key: key,
      data: value,
    );
    return Future.value(result);
  }

  /// Asking CacheXWorker to Get Data from cache using the key
  Future<String> getData({
    @required String key,
  }) async {
    String result = await _worker.getData(
      key: key,
    );
    return Future.value(result);
  }
}
