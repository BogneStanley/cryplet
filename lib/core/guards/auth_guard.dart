import 'package:cryplet/core/services/app_storage_service.dart';
import 'package:cryplet/features/auth/screens/login/login_screen.dart';
import 'package:cryplet/shared/data/auth/models/user_model.dart';
import 'package:flutter/widgets.dart';

import '../contracts/guard_contract.dart';

class AuthGuard extends GuardContract {
  AuthGuard() : super(const LoginScreen());

  @override
  bool isActive([BuildContext? context]) {
    if (context == null) {
      return false;
    }
    String? token = AppStorageService.getToken();
    UserModel? user = AppStorageService.getUser();

    if (token == null || token.isEmpty || user == null) {
      return false;
    }
    return true;
  }
}
