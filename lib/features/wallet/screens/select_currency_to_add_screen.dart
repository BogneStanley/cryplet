import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/utils/tools.dart';
import 'package:cryplet/features/wallet/screens/state/get_currencies_list_cubit/get_currencies_list_cubit.dart';
import 'package:cryplet/shared/data/crypto/models/crypto_currency_model.dart';
import 'package:cryplet/shared/states/wallet/wallet_cubit.dart';
import 'package:cryplet/shared/widgets/app_buttons/app_icon_button.dart';
import 'package:cryplet/shared/widgets/currency_item.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'controller/select_currency_to_add_controller.dart';

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
          if (ctrl.state.errorMessage != null)
            Expanded(
              child: LoadErroMessagesWidget(
                message: ctrl.state.errorMessage!,
                onRetry: () => ctrl.reloadCurrencies(),
              ),
            )
          else if (ctrl.currencies.isEmpty)
            const Expanded(
              child: LoadErroMessagesWidget(
                message: 'No Currencies Found',
              ),
            )
          else if (ctrl.state.isLoading)
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else
            Expanded(
              child: Column(children: [
                const AppTitle(
                  'Select Currency',
                ).title3(),
                20.ph,
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => ctrl.reloadCurrencies(),
                    child: ListView.builder(
                        itemCount: ctrl.currencies.length,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (context, index) {
                          var currency = ctrl.currencies[index];
                          Color color = Tools.generatePaleRandomColor();
                          return CurrencyItem(
                            color: color,
                            cryproName: currency.name ?? '',
                            cryproSymbol: currency.symbol ?? '',
                            cryproIcon: currency.image ?? '',
                            numberOfCoin: 1,
                            cryproChangeRate: currency.currentPrice ?? 0.0,
                            showFavoriteAction: false,
                            onPressed: () => ctrl.goToAddCurrency(currency.id!),
                          );
                        }),
                  ),
                )
              ]),
            ),
        ],
      ),
    );
  }
}

class LoadErroMessagesWidget extends StatelessWidget {
  const LoadErroMessagesWidget({
    super.key,
    required this.message,
    this.onRetry,
  });

  final String message;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: AppColors.red,
            size: 50,
          ),
          AppTitle(message, color: AppColors.grey).title1(),
          20.ph,
          AppIconButton(
            label: 'Retry',
            icon: const Icon(
              Icons.refresh,
            ),
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
