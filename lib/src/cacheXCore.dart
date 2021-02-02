part of cache_x;

class CacheXCore {
  static final CacheXCore instance = CacheXCore._ins();
  factory CacheXCore() => instance;
  CacheXCore._ins();
  CacheXWorker worker;

  /// Initialize th CacheXCore
  init(String password) async {
    /// Initializeing worker using specified password
    worker = CacheXWorker(password);
  }

  /// Send data to CacheXWorker to Save data
  Future<bool> saveData(String key, String data) async {
    bool result = await worker.saveData(key, data);
    return Future.value(result);
  }

  /// Asking CacheXWorker to Get Data from cache using the key
  Future<String> getData(String key) async {
    String result = await worker.getData(key);
    return Future.value(result);
  }
}
