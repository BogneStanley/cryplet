part of '../app_routes.dart';

class _SettingsRoutes extends ModuleRoutesContract {
  const _SettingsRoutes();

  static const String _settings = '/settings';

  String get settings => _settings;

  @override
  Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case _settings:
        return buildRoute(const SettingsScreen());
      default:
        return null;
    }
  }
}
