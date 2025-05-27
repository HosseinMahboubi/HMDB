import 'package:get_storage/get_storage.dart';

class HMLocalStorage {
  static final HMLocalStorage _instance = HMLocalStorage._internal();

  factory HMLocalStorage() {
    /// --- Only one instance exists throughout your app ---
    return _instance;
  }

  HMLocalStorage._internal();

  /// --- Simple key-value storage ---
  final _storage = GetStorage();

  /// -- GENERIC METHOD TO SAVE DATA --
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  /// -- GENERIC METHOD TO READ DATA --
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  /// -- GENERIC METHOD TO REMOVE DATA --
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  /// -- CLEAR ALL DATA IN STORAGE --
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
