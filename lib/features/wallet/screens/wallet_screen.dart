import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/utils/tools.dart';
import 'package:cryplet/shared/widgets/app_buttons/app_icon_button.dart';
import 'package:cryplet/shared/widgets/card/user_ballance_card.dart';
import 'package:cryplet/shared/widgets/currency_item.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/widgets/app_bar/app_bottom_nav_bar.dart';
import 'package:cryplet/shared/widgets/app_bar/user_app_bar.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:flutter/material.dart';

part '../controller/wallet_screen_controller.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = _WalletScreenController(context: context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserAppBar(
              userName: 'Stanley Brown',
              userAvatar: '',
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  const UserBallanceCard(),
                  40.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppTitle(
                        'My Currencies',
                      ).title3(),
                      AppIconButton(
                        label: 'Add',
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.dark,
                        ),
                        onPressed: ctrl.goToSelectCurrencyToAdd,
                      ),
                    ],
                  ),
                  20.ph,
                  ...List.generate(
                    5,
                    (index) {
                      Color color = Tools.generatePaleRandomColor();
                      return CurrencyItem(
                        color: color,
                        cryproName: 'Bitcoin',
                        cryproSymbol: 'BTC',
                        cryproIcon: 'assets/images/bitcoin.png',
                        numberOfCoin: 3,
                        cryproChangeRate: 16500.0,
                        isFavorite: index % 2 == 0,
                        toggleFavorite: () {
                          print('toggle favorite');
                        },
                        onPressed: () => ctrl.goToCurrencyDetails(1),
                      );
                    },
                  ),
                ],
              ),
            ),
            const AppBottomNavbar(
              currentIndex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
