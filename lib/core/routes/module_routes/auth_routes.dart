part of '../app_routes.dart';

class _AuthRoutes extends ModuleRoutesContract {
  const _AuthRoutes();

  static const String _login = '/login';
  static const String _register = '/register';

  String get login => _login;
  String get register => _register;

  @override
  Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case _login:
        return buildRoute(const LoginScreen());
      case _register:
        return buildRoute(const RegisterScreen());
      default:
        return null;
    }
  }
}
