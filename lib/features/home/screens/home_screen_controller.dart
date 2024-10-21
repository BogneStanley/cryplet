part of 'home_screen.dart';

class _HomeScreenController extends ScreenControllerContract {
  _HomeScreenController({required super.context});

  WalletState get walletState => context.watch<WalletCubit>().state;

  void goToCurrencyDetails(CryptoCurrencyModel id) {
    Navigator.pushNamed(
      context,
      AppRoutes.walletRoutes.currencyDetails,
      arguments: id,
    );
  }
}
