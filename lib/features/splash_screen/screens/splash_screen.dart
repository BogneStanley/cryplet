import 'package:cryplet/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

part 'splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = _SplashScreenController(context);
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: ctrl.goToLoginScreen,
          child: const Text('Login'),
        ),
      ),
    );
  }
}
