part of '../app_routes.dart';

class _HomeRoutes extends ModuleRoutesContract {
  const _HomeRoutes();

  static const String _home = '/home';

  String get home => _home;

  @override
  Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case _home:
        return buildRoute(
          const HomeScreen(),
          guard: AuthGuard(),
        );
      default:
        return null;
    }
  }
}
