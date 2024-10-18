import 'package:get_storage/get_storage.dart';

class AppStorageService {
  static late GetStorage _box;
  static const String _remoteUserTokenKey = 'remote_user_token';

  static Future<void> init() async {
    await GetStorage.init();
    _box = GetStorage();
  }

  static T? read<T>(String key) {
    return _box.read<T>(key);
  }

  static void write(String key, dynamic value) {
    _box.write(key, value);
  }

  static void remove(String key) {
    _box.remove(key);
  }

  static void clear() {
    _box.erase();
  }

  static String? getToken() => read(_remoteUserTokenKey);

  static void setToken(String token) {
    write(_remoteUserTokenKey, token);
  }

  static void removeToken() {
    remove(_remoteUserTokenKey);
  }
}
