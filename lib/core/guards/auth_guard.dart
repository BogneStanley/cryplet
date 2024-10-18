import 'package:cryplet/features/auth/screens/login/login_screen.dart';
import 'package:cryplet/shared/states/auth/auth_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../contracts/guard_contract.dart';

class AuthGuard extends GuardContract {
  AuthGuard() : super(const LoginScreen());

  @override
  bool isActive([BuildContext? context]) {
    if (context == null) {
      return false;
    }
    return context.read<AuthCubit>().state.isAuth;
  }
}
