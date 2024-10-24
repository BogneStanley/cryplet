import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/utils/forms/app_form_control.dart';
import 'package:cryplet/core/utils/forms/app_form_validator.dart';
import 'package:cryplet/core/utils/tools.dart';
import 'package:cryplet/features/wallet/screens/state/get_currencies_list_cubit/get_currencies_list_cubit.dart';
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

part 'controllers/add_currency_screen_controller.dart';

class AddCurrencyScreen extends StatefulWidget {
  const AddCurrencyScreen({super.key, required this.id});

  final String id;

  @override
  State<AddCurrencyScreen> createState() => _AddCurrencyScreenState();
}

class _AddCurrencyScreenState extends State<AddCurrencyScreen> {
  late final _AddCurrencyScreenController _ctrl;

  @override
  void initState() {
    super.initState();

    _ctrl = _AddCurrencyScreenController(
      context: context,
      id: widget.id,
      setState: setState,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _ctrl.dispose();
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
                      child: Image.network(
                        _ctrl.cryptoCurrency.image ?? '',
                        width: 60,
                        height: 60,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.circle,
                          size: 60,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppTitle(
                        _ctrl.cryptoCurrency.name ?? '',
                      ).title1(),
                    ),
                  ],
                ),
                20.ph,
                const AppTitle(
                  'Variation History',
                ).title3(),
                20.ph,
                SizedBox(
                  height: 150,
                  child: _ctrl.dataIsLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _ctrl.history.isEmpty
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
                                      ..._ctrl.history.map((e) =>
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
                      onPressed: _ctrl.getHistory,
                      icon: const Icon(
                        Icons.refresh,
                      ),
                    )
                  ],
                ),
                20.ph,
                ..._ctrl.history
                    .asMap()
                    .entries
                    .map(
                      (entrie) => GestureDetector(
                        onTap: () => print(entrie.value.price),
                        child: VariationItem(
                          isUp: entrie.key == 0
                              ? null
                              : Tools.priceIsMore(
                                  _ctrl.history[entrie.key - 1].price,
                                  entrie.value.price),
                          time: entrie.value.timeFormatted,
                          price: entrie.value.price.to2Decimal,
                        ),
                      ),
                    )
                    .toList()
                    .reversed,
                250.ph,
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _ctrl.formGroup.formKey,
          child: IntrinsicHeight(
            child: Column(
              children: [
                AppTextField(
                  label: 'Amount',
                  controller: _ctrl.formGroup.amount.controller,
                  textInputType: TextInputType.number,
                  validator: _ctrl.formGroup.amount.validate,
                ),
                20.ph,
                SizedBox(
                  height: 60,
                  child: AppButton(
                    onPressed: _ctrl.addCurrencyToWallet,
                    label: 'Add',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
