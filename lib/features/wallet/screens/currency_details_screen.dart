import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/core/utils/forms/app_form_control.dart';
import 'package:cryplet/core/utils/forms/app_form_validator.dart';
import 'package:cryplet/core/utils/tools.dart';
import 'package:cryplet/features/wallet/screens/widgets/variation_item.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/data/crypto/models/crypto_currency_model.dart';
import 'package:cryplet/shared/data/crypto/models/history_data_item_model.dart';
import 'package:cryplet/shared/states/wallet/wallet_cubit.dart';
import 'package:cryplet/shared/widgets/app_buttons/app_button.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:cryplet/shared/widgets/text_field/app_text_field.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

part './controllers/currency_details_screen_controller.dart';

class CurrencyDetailsScreen extends StatefulWidget {
  const CurrencyDetailsScreen({super.key, required this.id});

  final String id;

  @override
  State<CurrencyDetailsScreen> createState() => _CurrencyDetailsScreenState();
}

class _CurrencyDetailsScreenState extends State<CurrencyDetailsScreen> {
  late final _CurrencyDetailsScreenController ctrl;

  @override
  void initState() {
    super.initState();

    ctrl = _CurrencyDetailsScreenController(
        context: context, id: widget.id, setState: setState);
  }

  @override
  void dispose() {
    super.dispose();
    ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(ctrl.currency.image ?? '',
                          width: 60, height: 60,
                          errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.circle,
                          size: 60,
                          color: AppColors.primary,
                        );
                      }),
                    ),
                    const SizedBox(width: 10),
                    AppTitle(
                      ctrl.currency.name ?? '',
                    ).title1(),
                    const Spacer(),
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          AppColors.primary.withOpacity(0.2),
                        ),
                        shape: WidgetStateProperty.all(
                          const CircleBorder(),
                        ),
                      ),
                      onPressed: ctrl.addCurrencyToFavorite,
                      icon: Icon(
                        ctrl.currency.isFavorite ?? false
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppColors.primary,
                      ),
                    ),
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          AppColors.red.withOpacity(0.2),
                        ),
                        shape: WidgetStateProperty.all(
                          const CircleBorder(),
                        ),
                      ),
                      onPressed: ctrl.deleteCurrency,
                      icon: const Icon(
                        Icons.delete,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
                20.ph,
                SmoothCard(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColors.primary.withOpacity(0.1),
                  smoothness: 1.0,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: const AppTitle(
                                'Balance',
                              ).title2(),
                            ),
                            IconButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  AppColors.primary.withOpacity(0.2),
                                ),
                                shape: WidgetStateProperty.all(
                                  const CircleBorder(),
                                ),
                              ),
                              onPressed: ctrl.showUpdateBottomSheet,
                              icon: const Icon(
                                Icons.edit,
                              ),
                            ),
                            IconButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  AppColors.primary.withOpacity(0.2),
                                ),
                                shape: WidgetStateProperty.all(
                                  const CircleBorder(),
                                ),
                              ),
                              onPressed: ctrl.hideAmount,
                              icon: Icon(
                                ctrl.walletCubit.state.hideAmount
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          ctrl.balance,
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                        AppTitle(ctrl.usdBalance, color: AppColors.grey)
                            .title4(),
                      ],
                    ),
                  ),
                ),
                20.ph,
                const AppTitle(
                  'Variation History',
                ).title3(),
                20.ph,
                SizedBox(
                  height: 150,
                  child: ctrl.dataIsLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ctrl.history.isEmpty
                          ? Center(
                              child:
                                  const AppTitle('No Data Available').title4(),
                            )
                          : LineChart(
                              LineChartData(
                                gridData: const FlGridData(
                                  show: false,
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                baselineX: 0,
                                baselineY: 0,
                                minY: 0,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      ...ctrl.history.map((e) =>
                                          FlSpot(e.time.toDouble(), e.price)),
                                    ],
                                    isCurved: true,
                                    curveSmoothness: 0.3,
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.primary,
                                        AppColors.orange,
                                      ]
                                          .map(
                                              (color) => color.withOpacity(0.5))
                                          .toList(),
                                    ),
                                    belowBarData: BarAreaData(
                                      show: true,
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.primary.withOpacity(0.2),
                                          AppColors.orange.withOpacity(0.1),
                                        ],
                                      ),
                                    ),
                                    barWidth: 5,
                                    isStrokeCapRound: true,
                                    dotData: const FlDotData(
                                      show: false,
                                    ),
                                  ),
                                ],
                                titlesData: const FlTitlesData(
                                  show: false,
                                ),
                              ),
                            ),
                ),
                20.ph,
                Row(
                  children: [
                    Expanded(
                      child: const AppTitle(
                        'Last',
                      ).title4(),
                    ),
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          AppColors.primary.withOpacity(0.2),
                        ),
                        shape: WidgetStateProperty.all(
                          const CircleBorder(),
                        ),
                      ),
                      onPressed: ctrl.getHistory,
                      icon: const Icon(
                        Icons.refresh,
                      ),
                    )
                  ],
                ),
                20.ph,
                ...ctrl.history
                    .asMap()
                    .entries
                    .map(
                      (entrie) => GestureDetector(
                        onTap: () => print(entrie.value.price),
                        child: VariationItem(
                          isUp: entrie.key == 0
                              ? null
                              : Tools.priceIsMore(
                                  ctrl.history[entrie.key - 1].price,
                                  entrie.value.price),
                          time: entrie.value.timeFormatted,
                          price: entrie.value.price.to2Decimal,
                        ),
                      ),
                    )
                    .toList()
                    .reversed,
                20.ph,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
