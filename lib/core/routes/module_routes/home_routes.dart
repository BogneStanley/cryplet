part of '../app_routes.dart';

class _HomeRoutes extends ModuleRoutesContract {
  const _HomeRoutes();

  static const String _home = '/home';

  static String get home => _home;

  @override
  Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case _home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return null;
    }
  }
}
