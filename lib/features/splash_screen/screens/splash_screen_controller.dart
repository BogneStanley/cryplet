part of 'splash_screen.dart';

class _SplashScreenController extends ScreenControllerContract {
  final BuildContext _context;

  _SplashScreenController(this._context) : super(context: _context);

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    String? token = AppStorageService.getToken();
    final userResult = AppStorageService.getUser();

    if (token == null || token.isEmpty || userResult == null) {
      goToLoginScreen();
      return;
    }
    UserModel user = userResult;
    if (user.id == null) {
      goToLoginScreen();
      return;
    }

    bool hasInternet = await InternetConnection().hasInternetAccess;

    if (!hasInternet) {
      goToDisconnectedScreen();
      return;
    }

    final res = await context.read<AuthCubit>().me(user.id!);

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

  void goToDisconnectedScreen() {
    Navigator.pushNamedAndRemoveUntil(
      _context,
      AppRoutes.errorRoutes.disconnectedError,
      (route) => false,
    );
  }
}
