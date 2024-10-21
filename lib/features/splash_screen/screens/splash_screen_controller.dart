part of 'splash_screen.dart';

class _SplashScreenController {
  final BuildContext _context;

  _SplashScreenController(this._context);

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    String? token = AppStorageService.getToken();
    final userResult = sl<AuthRepository>().getUser();

    if (token == null || token.isEmpty || userResult.isLeft()) {
      goToLoginScreen();
      return;
    }
    UserModel user = userResult.getOrElse(() => UserModel());
    if (user.id == null) {
      goToLoginScreen();
      return;
    }

    final res = await sl<AuthCubit>().me(user.id!);

    if (res != null) {
      goToLoginScreen();
    } else {
      goToHomeScreen();
    }
  }

  void goToLoginScreen() {
    print(AppConfig.appBaseUrl);
    Navigator.pushNamedAndRemoveUntil(
        _context, AppRoutes.authRoutes.login, (route) => false);
  }

  void goToHomeScreen() {
    Navigator.pushNamedAndRemoveUntil(
      _context,
      AppRoutes.homeRoutes.home,
      (route) => false,
    );
  }
}
