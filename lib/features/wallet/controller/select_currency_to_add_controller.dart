part of '../screens/select_currency_to_add_screen.dart';

class _SelectCurrencyToAddController extends ScreenControllerContract {
  _SelectCurrencyToAddController({required super.context});

  void goToAddCurrency(int id) {
    Navigator.pushNamed(
      context,
      AppRoutes.walletRoutes.addCurrency,
      arguments: id,
    );
  }
}
