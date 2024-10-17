part of '../app_routes.dart';

abstract class _ModuleRoutesContract {
  const _ModuleRoutesContract();
  Route<dynamic>? getRoutes(RouteSettings settings);
}
