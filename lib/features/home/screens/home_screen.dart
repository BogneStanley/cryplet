import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/utils/tools.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/data/crypto/models/crypto_currency_model.dart';
import 'package:cryplet/shared/states/wallet/wallet_cubit.dart';
import 'package:cryplet/shared/widgets/app_bar/app_bottom_nav_bar.dart';
import 'package:cryplet/shared/widgets/app_bar/user_app_bar.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:cryplet/shared/widgets/card/user_ballance_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../../shared/widgets/favorite_currency_item.dart';

part 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = _HomeScreenController(context: context);
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
                  30.ph,
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primary.withOpacity(0.1),
                    ),
                    child: PieChart(
                      PieChartData(
                        sections: [
                          ...ctrl.walletState.walletCrypto.map(
                            (e) => PieChartSectionData(
                              color: Tools.generatePaleRandomColor(),
                              value: (e.myBalance ?? 0) * (e.currentPrice ?? 0),
                              title: e.symbol,
                              titleStyle: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                        centerSpaceRadius: 45,
                        sectionsSpace: 2,
                      ),
                    ),
                  ),
                  40.ph,
                  const AppTitle(
                    'Favorites Currencies',
                  ).title3(),
                  20.ph,
                  if (ctrl.walletState.favoriteCrypto.isEmpty)
                    SmoothCard(
                      elevation: 0,
                      borderRadius: BorderRadius.circular(15),
                      smoothness: 1,
                      child: SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: const AppTitle('No Favorite',
                                  color: AppColors.grey)
                              .title2(),
                        ),
                      ),
                    ),
                  if (ctrl.walletState.favoriteCrypto.isNotEmpty)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...ctrl.walletState.favoriteCrypto.map((e) {
                            Color color = Tools.generatePaleRandomColor();
                            return FavoriteCurrencyItem(
                              color: color,
                              cryproName: e.name ?? '',
                              amountIHave: e.myBalance ?? 0,
                              cryproChangeRate: e.currentPrice ?? 0,
                              cryproIcon: e.image ?? '',
                              cryproSymbol: e.symbol ?? '',
                              onPressed: null,
                            );
                          })
                        ],
                      ),
                    )
                ],
              ),
            ),
            const AppBottomNavbar(currentIndex: 0),
          ],
        ),
      ),
    );
  }
}
