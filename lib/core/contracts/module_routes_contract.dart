import 'package:flutter/material.dart';

import 'guard_contract.dart';

abstract class ModuleRoutesContract {
  const ModuleRoutesContract();
  Route<dynamic>? getRoutes(RouteSettings settings);

  MaterialPageRoute<dynamic> buildRoute(Widget screen, {GuardContract? guard}) {
    return MaterialPageRoute(builder: (context) {
      if (guard != null && !guard.isActive(context)) {
        return guard.redirectScreen;
      } else {
        return screen;
      }
    });
  }
}
