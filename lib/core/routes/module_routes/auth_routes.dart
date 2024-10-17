part of '../app_routes.dart';

class _AuthRoutes extends _ModuleRoutesContract {
  const _AuthRoutes();

  static const String _login = '/login';
  static const String _register = '/register';

  String get login => _login;
  String get register => _register;

  @override
  Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case _login:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
      case _register:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
      default:
        return null;
    }
  }
}
