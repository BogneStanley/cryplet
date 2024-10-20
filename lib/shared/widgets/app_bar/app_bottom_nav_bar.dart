import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomNavbar extends StatelessWidget {
  const AppBottomNavbar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  void _goToScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.homeRoutes.home, (route) => false);
        break;
      case 1:
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.walletRoutes.wallet, (route) => false);
        break;
      case 2:
        // Navigator.pushNamedAndRemoveUntil(
        //     context, AppRoutes.homeRoutes.home, (route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: AppColors.white,
      onDestinationSelected: (int index) => _goToScreen(index, context),
      selectedIndex: currentIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(
            Icons.home,
            color: AppColors.primary,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.wallet_outlined),
          selectedIcon: Icon(
            Icons.wallet,
            color: AppColors.primary,
          ),
          label: 'wallet',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.settings_outlined,
          ),
          selectedIcon: Icon(
            Icons.settings,
            color: AppColors.primary,
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
