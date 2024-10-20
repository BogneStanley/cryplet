import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/utils/tools.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/widgets/app_bar/app_bottom_nav_bar.dart';
import 'package:cryplet/shared/widgets/app_bar/user_app_bar.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:cryplet/shared/widgets/card/user_ballance_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  const UserBallanceCard(),
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
                          PieChartSectionData(
                            color: Tools.generatePaleRandomColor(),
                            value: 25,
                            title: 'BTC',
                            titleStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PieChartSectionData(
                            color: Tools.generatePaleRandomColor(),
                            value: 25,
                            title: '25%',
                            titleStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PieChartSectionData(
                            color: Tools.generatePaleRandomColor(),
                            value: 25,
                            title: '25%',
                            titleStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PieChartSectionData(
                            color: Tools.generatePaleRandomColor(),
                            value: 25,
                            title: '25%',
                            titleStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PieChartSectionData(
                            color: Tools.generatePaleRandomColor(),
                            value: 25,
                            title: '25%',
                            titleStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PieChartSectionData(
                            color: Tools.generatePaleRandomColor(),
                            value: 75,
                            title: '75%',
                            titleStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) {
                            Color color = Tools.generatePaleRandomColor();
                            return FavoriteCurrencyItem(
                              color: color,
                              cryproName: 'Bitcoin',
                              amountIHave: 0.8,
                              cryproChangeRate: 16500.0,
                              cryproIcon: '',
                              cryproSymbol: 'BTC',
                              onPressed: () => ctrl.goToCurrencyDetails(index),
                            );
                          },
                        ),
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
