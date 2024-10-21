import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/utils/tools.dart';
import 'package:cryplet/shared/data/crypto/models/crypto_currency_model.dart';
import 'package:cryplet/shared/states/wallet/wallet_cubit.dart';
import 'package:cryplet/shared/widgets/app_buttons/app_icon_button.dart';
import 'package:cryplet/shared/widgets/card/user_ballance_card.dart';
import 'package:cryplet/shared/widgets/currency_item.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/widgets/app_bar/app_bottom_nav_bar.dart';
import 'package:cryplet/shared/widgets/app_bar/user_app_bar.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'controllers/wallet_screen_controller.dart';

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
                  UserBallanceCard(
                    balance: ctrl.walletState.totalBalance.to2Decimal,
                  ),
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
                  ...ctrl.walletState.walletCrypto.map((e) {
                    Color color = Tools.generatePaleRandomColor();
                    return CurrencyItem(
                      color: color,
                      cryproName: e.name ?? '',
                      cryproSymbol: e.symbol ?? '',
                      cryproIcon: e.image ?? '',
                      numberOfCoin: e.myBalance ?? 0,
                      cryproChangeRate: 16500.0,
                      isFavorite: e.isFavorite ?? false,
                      toggleFavorite: () => ctrl.addCurrencyToFavorite(e),
                      onPressed: () => ctrl.goToCurrencyDetails(e.id!),
                    );
                  })
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
