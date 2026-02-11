abstract class LocalStorageService {
  Future<void> init();
  Future<void> openBox<T>(String boxName);
  List<T> getAll<T>(String boxName);
  T? get<T>(String boxName, String key);
  Future<void> put<T>(String boxName, String key, T value);
  Future<void> delete<T>(String boxName, String key);
  bool contains(String boxName, dynamic key);
}
