import 'package:cryplet/core/guards/auth_guard.dart';
import 'package:cryplet/features/auth/screens/login/login_screen.dart';
import 'package:cryplet/features/auth/screens/register/register_screen.dart';
import 'package:cryplet/features/errors/screens/disconnected_error_screen.dart';
import 'package:cryplet/features/home/screens/home_screen.dart';
import 'package:cryplet/features/wallet/screens/add_currency_screen.dart';
import 'package:cryplet/features/wallet/screens/select_currency_to_add_screen.dart';
import 'package:cryplet/features/wallet/screens/currency_details_screen.dart';
import 'package:cryplet/features/wallet/screens/wallet_screen.dart';
import 'package:flutter/material.dart';

import '../../features/splash_screen/screens/splash_screen.dart';
import '../contracts/module_routes_contract.dart';

part 'module_routes/splash_screen_routes.dart';
part 'module_routes/auth_routes.dart';
part 'module_routes/home_routes.dart';
part 'module_routes/wallet_routes.dart';
part 'module_routes/error_routes.dart';

class AppRoutes {
  static const authRoutes = _AuthRoutes();
  static const splashScreenRoutes = _SplashScreenRoutes();
  static const homeRoutes = _HomeRoutes();
  static const walletRoutes = _WalletRoutes();
  static const errorRoutes = _ErrorRoutes();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    authRoutes.login;
    return authRoutes.getRoutes(settings) ??
        splashScreenRoutes.getRoutes(settings) ??
        homeRoutes.getRoutes(settings) ??
        walletRoutes.getRoutes(settings) ??
        errorRoutes.getRoutes(settings) ??
        MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
