part of '../wallet_screen.dart';

class _WalletScreenController extends ScreenControllerContract {
  _WalletScreenController({required super.context});

  WalletState get walletState => context.watch<WalletCubit>().state;
  WalletCubit get walletCubit => context.read<WalletCubit>();
  UserModel? get user => context.read<AuthCubit>().state.user;

  void goToCurrencyDetails(String id) {
    Navigator.pushNamed(
      context,
      AppRoutes.walletRoutes.currencyDetails,
      arguments: id,
    );
  }

  void hideAmount() {
    walletCubit.toggleHideAmount();
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
