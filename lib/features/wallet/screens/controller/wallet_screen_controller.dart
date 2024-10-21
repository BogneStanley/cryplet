part of '../wallet_screen.dart';

class _WalletScreenController extends ScreenControllerContract {
  _WalletScreenController({required super.context});

  WalletState get walletState => context.watch<WalletCubit>().state;
  WalletCubit get walletCubit => context.read<WalletCubit>();

  void goToCurrencyDetails(String id) {
    Navigator.pushNamed(
      context,
      AppRoutes.walletRoutes.currencyDetails,
      arguments: id,
    );
  }

  void addCurrencyToFavorite(CryptoCurrencyModel currency) {
    walletCubit.updateCrypto(currency.copyWith(
      isFavorite: !(currency.isFavorite ?? false),
    ));
  }

  void goToSelectCurrencyToAdd() {
    Navigator.pushNamed(context, AppRoutes.walletRoutes.selectCurrencyToAdd);
  }
}
