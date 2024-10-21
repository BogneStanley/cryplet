part of '../select_currency_to_add_screen.dart';

class _SelectCurrencyToAddController extends ScreenControllerContract {
  _SelectCurrencyToAddController({required super.context});

  GetCurrenciesListCubit get cubit => context.read<GetCurrenciesListCubit>();
  WalletCubit get walletCubit => context.read<WalletCubit>();
  GetCurrenciesListState get state =>
      context.watch<GetCurrenciesListCubit>().state;

  void goToAddCurrency(String id) {
    Navigator.pushNamed(
      context,
      AppRoutes.walletRoutes.addCurrency,
      arguments: id,
    );
  }

  List<CryptoCurrencyModel> get currencies {
    return state.currenciesList
        .where((e) => walletCubit.state.walletCrypto
            .where((element) => element.id == e.id)
            .isEmpty)
        .toList();
  }

  reloadCurrencies() {
    cubit.getCurrencies();
  }
}
