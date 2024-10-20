part of '../screens/wallet_screen.dart';

class _WalletScreenController extends ScreenControllerContract {
  _WalletScreenController({required super.context});

  void goToCurrencyDetails(int id) {
    Navigator.pushNamed(
      context,
      AppRoutes.walletRoutes.currencyDetails,
      arguments: id,
    );
  }

  void goToSelectCurrencyToAdd() {
    Navigator.pushNamed(context, AppRoutes.walletRoutes.selectCurrencyToAdd);
  }
}
