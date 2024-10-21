import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/data/auth/models/user_model.dart';
import 'package:cryplet/shared/states/auth/auth_cubit.dart';
import 'package:cryplet/shared/widgets/app_bar/app_bottom_nav_bar.dart';
import 'package:cryplet/shared/widgets/app_bar/user_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_corner/smooth_corner.dart';

part 'settings_screen_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = _SettingsScreenController(context: context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            UserAppBar(
              userName: ctrl.user.username ?? '',
              userAvatar: ctrl.user.avatarUrl ?? '',
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  SmoothCard(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: const Text('Dark Theme'),
                        trailing: Switch(
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                  SmoothCard(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: const Text('Language'),
                        trailing: DropdownButton<String>(
                          value: 'en',
                          onChanged: (value) {},
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'en',
                              child: Text('English'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'fr',
                              child: Text('French'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SmoothCard(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15.0),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text('Update profile'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  SmoothCard(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15.0),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text('Update password'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  SmoothCard(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15.0),
                    color: AppColors.red.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: const Text('Logout'),
                        trailing: const Icon(Icons.logout),
                        onTap: ctrl.logout,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const AppBottomNavbar(currentIndex: 2),
          ],
        ),
      ),
    );
  }
}
