import 'package:cryplet/core/services/app_storage_service.dart';

class LocalAuthApi {
  LocalAuthApi();

  String? getApiToken() => AppStorageService.getToken();

  void setApiToken(String token) => AppStorageService.setToken(token);

  void clearApiToken() => AppStorageService.removeToken();
}
