import 'package:cryplet/features/auth/screens/login/login_screen.dart';
import 'package:cryplet/features/auth/screens/register/register_screen.dart';
import 'package:cryplet/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../features/splash_screen/screens/splash_screen.dart';
import '../contracts/module_routes_contract.dart';

part 'module_routes/splash_screen_routes.dart';
part 'module_routes/auth_routes.dart';
part 'module_routes/home_routes.dart';

class AppRoutes {
  static const authRoutes = _AuthRoutes();
  static const splashScreenRoutes = _SplashScreenRoutes();
  static const homeRoutes = _HomeRoutes();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    authRoutes.login;
    return authRoutes.getRoutes(settings) ??
        splashScreenRoutes.getRoutes(settings) ??
        homeRoutes.getRoutes(settings) ??
        MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
