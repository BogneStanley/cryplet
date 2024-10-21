import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/services/app_storage_service.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/constants/app_config.dart';
import 'package:cryplet/shared/data/auth/models/user_model.dart';
import 'package:cryplet/shared/states/auth/auth_cubit.dart';
import 'package:cryplet/shared/widgets/app_buttons/app_icon_button.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = _SplashScreenController(context);
    return Scaffold(
      body: FutureBuilder(
          future: ctrl.init(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppTitle(snapshot.error.toString(), color: AppColors.grey)
                      .title1(),
                  Center(
                    child: AppIconButton(
                      icon: const Icon(Icons.refresh, color: AppColors.primary),
                      onPressed: ctrl.init,
                      label: 'Retry',
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
