part of 'splash_screen.dart';

class _SplashScreenController {
  final BuildContext _context;

  _SplashScreenController(this._context);

  Future<void> init() async {}

  void goToLoginScreen() {
    print(AppConfig.appBaseUrl);
    Navigator.pushNamed(_context, AppRoutes.authRoutes.login);
  }
}
