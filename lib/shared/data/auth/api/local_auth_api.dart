import 'package:cryplet/core/services/app_storage_service.dart';
import 'package:cryplet/shared/data/auth/models/user_model.dart';

class LocalAuthApi {
  LocalAuthApi();

  String? getApiToken() => AppStorageService.getToken();

  void setApiToken(String token) => AppStorageService.setToken(token);

  void clearApiToken() => AppStorageService.removeToken();

  void saveUser(UserModel user) {
    AppStorageService.write('user', user.toJson());
  }

  UserModel? getUser() {
    final user = AppStorageService.read('user');
    if (user != null) {
      return UserModel.fromJson(user);
    } else {
      return null;
    }
  }

  void clearUser() {
    AppStorageService.remove('user');
  }
}
