import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal();

   final GetStorage _storage = GetStorage();

  // ---- Generic Method to Save Data ----- //
  Future<void> saveData<T>(String key, T value) async{
    await _storage.write(key, value);
  }

  // ---- Generic Method to read Data ----- //
  Future<void> readData<T>(String key) async{
    await _storage.read(key);
  }

  // ---- Generic Method to remove Data ----- //
  Future<void> removeData<T>(String key) async{
    await _storage.remove(key);
  }

  // --- Clear all data in storage --- //
  Future<void> clearAll() async {
    await _storage.erase();
  }
}