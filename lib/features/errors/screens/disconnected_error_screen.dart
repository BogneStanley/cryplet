import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/services/app_storage_service.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/data/auth/models/user_model.dart';
import 'package:cryplet/shared/states/auth/auth_cubit.dart';
import 'package:cryplet/shared/widgets/app_buttons/app_icon_button.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisconnectedErrorScreen extends StatelessWidget {
  const DisconnectedErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppTitle(
              'You are Disconnected',
              color: AppColors.grey,
              textAllign: TextAlign.center,
            ).title1(),
            20.ph,
            const AppTitle(
              'Please check your internet connection',
              color: AppColors.grey,
              textAllign: TextAlign.center,
            ).title3(),
            20.ph,
            AppIconButton(
              label: 'Retry',
              icon: const Icon(
                Icons.refresh,
                color: AppColors.dark,
              ),
              onPressed: () => goToSplashScreen(context),
            ),
            20.ph,
            const AppTitle('Or').title5(),
            20.ph,
            AppIconButton(
              label: 'Continue on offline mode',
              icon: const Icon(
                Icons.arrow_circle_right_outlined,
                color: AppColors.dark,
              ),
              onPressed: () => onContinueToOffline(context),
            ),
          ],
        ),
      ),
    );
  }

  goToSplashScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.splashScreenRoutes.splashScreen, (route) => false);
  }

  onContinueToOffline(BuildContext context) {
    UserModel? user = AppStorageService.getUser();
    if (user == null) {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.authRoutes.login, (route) => false);
      return;
    }
    context.read<AuthCubit>().setUser(user);
    context.read<AuthCubit>().enableOfflineMode();
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.homeRoutes.home, (route) => false);
  }
}
