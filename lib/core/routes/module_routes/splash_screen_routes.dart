part of '../app_routes.dart';

class _SplashScreenRoutes extends ModuleRoutesContract {
  const _SplashScreenRoutes();

  static const String _splashScreen = '/splashScreen';

  String get splashScreen => _splashScreen;

  @override
  Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case _splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      default:
        return null;
    }
  }
}
