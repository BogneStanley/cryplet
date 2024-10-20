import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/utils/tools.dart';
import 'package:cryplet/shared/widgets/currency_item.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:flutter/material.dart';

part '../controller/select_currency_to_add_controller.dart';

class SelectCurrencyToAddScreen extends StatelessWidget {
  const SelectCurrencyToAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = _SelectCurrencyToAddController(context: context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                const AppTitle(
                  'Select Currency',
                ).title3(),
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
                      numberOfCoin: 1,
                      cryproChangeRate: 16500.0,
                      showFavoriteAction: false,
                      onPressed: () => ctrl.goToAddCurrency(index),
                    );
                  },
                ),
                20.ph,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
