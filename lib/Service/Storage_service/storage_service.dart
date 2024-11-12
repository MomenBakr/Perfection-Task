import 'package:get_storage/get_storage.dart';



const languageKey = 'language';

class StorageService {
  static final GetStorage storage = GetStorage();

  // Save user data (boolean)
  static Future<void> saveUserData({
    required bool data,
    required String key,
  }) async {
    await storage.write(key, data);
  }

  // Retrieve user data with a default value of `false`
  static bool getUserData(String key) {
    return storage.read(key) ?? false;
  }

  // Clear user data
  static Future<void> clearUserData(String key) async {
    await storage.remove(key);
  }
}

