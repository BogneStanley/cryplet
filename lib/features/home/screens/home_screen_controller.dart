part of 'home_screen.dart';

class _HomeScreenController extends ScreenControllerContract {
  _HomeScreenController({required super.context});

  void goToCurrencyDetails(int id) {
    Navigator.pushNamed(
      context,
      AppRoutes.walletRoutes.currencyDetails,
      arguments: id,
    );
  }
}
