import 'package:cryplet/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:dotenv/dotenv.dart';

void main() {
  var env = DotEnv()..load();
  env.getOrElse(
    'API_KEY',
    () => 'API_KEY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashScreenRoutes.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
