part of '../app_routes.dart';

class _ErrorRoutes extends ModuleRoutesContract {
  const _ErrorRoutes();

  static const String _disconnectedError = '/disconnected-error';

  String get disconnectedError => _disconnectedError;

  @override
  Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case _disconnectedError:
        return buildRoute(const DisconnectedErrorScreen());
      default:
        return null;
    }
  }
}
