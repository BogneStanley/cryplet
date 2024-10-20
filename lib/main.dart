import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/services/app_storage_service.dart';
import 'package:cryplet/core/services/dependancies_injection_container.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/constants/app_config.dart';
import 'package:cryplet/shared/states/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependanciesInjectionContainer.init();
  await AppStorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: AppConfig.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              textTheme: GoogleFonts.poppinsTextTheme(),
              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.white,
              ),
              useMaterial3: true,
            ),
            initialRoute: AppRoutes.splashScreenRoutes.splashScreen,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        },
      ),
    );
  }
}
