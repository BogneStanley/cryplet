import 'package:flutter/material.dart';

part 'module_routes/module_routes_contract.dart';
part 'module_routes/splash_screen_routes.dart';
part 'module_routes/auth_routes.dart';

class AppRoutes {
  static const authRoutes = _AuthRoutes();
  static const splashScreenRoutes = _SplashScreenRoutes();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    authRoutes.login;
    return authRoutes.getRoutes(settings) ??
        splashScreenRoutes.getRoutes(settings) ??
        MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
