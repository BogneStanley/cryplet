part of 'auth_cubit.dart';

class AuthState {
  final bool loginInProgess;
  final bool registerInProgess;
  final bool gettingUserInProgess;
  final String? errorMessage;
  final UserModel? user;
  AuthState({
    this.loginInProgess = false,
    this.registerInProgess = false,
    this.gettingUserInProgess = false,
    this.user,
    this.errorMessage,
  });

  bool get isAuth => user != null;

  AuthState copyWith({
    bool? loginInProgess,
    bool? registerInProgess,
    bool? gettingUserInProgess,
    String? errorMessage,
    UserModel? user,
  }) {
    return AuthState(
      loginInProgess: loginInProgess ?? this.loginInProgess,
      registerInProgess: registerInProgess ?? this.registerInProgess,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      gettingUserInProgess: gettingUserInProgess ?? this.gettingUserInProgess,
    );
  }
}
