part of '../add_currency_screen.dart';

class _AddCurrencyScreenController extends ScreenControllerContract {
  String id;
  _AddCurrencyScreenController({
    required super.context,
    required this.id,
    super.setState,
  }) {
    getHistory();
  }

  final formGroup = (
    formKey: GlobalKey<FormState>(),
    amount: AppFormControl<String>(
      validators: [AppFormValidators.required],
    ),
  );

  List<HistoryDataItemModel> history = [];
  bool dataIsLoading = false;

  Future<void> getHistory() async {
    dataIsLoading = true;
    updateUi();
    final res = await walletCubit.getHistory(id);

    if (res != null) {
      history = res;
    }

    dataIsLoading = false;
    updateUi();
  }

  WalletCubit get walletCubit => context.read<WalletCubit>();

  CryptoCurrencyModel get cryptoCurrency => context
      .read<GetCurrenciesListCubit>()
      .state
      .currenciesList
      .firstWhere((element) => element.id == id);

  bool priceIsMore(HistoryDataItemModel a, HistoryDataItemModel b) {
    return a.price > b.price;
  }

  void addCurrencyToWallet() async {
    if (!formGroup.formKey.currentState!.validate()) {
      return;
    }
    CryptoCurrencyModel crypto = cryptoCurrency.copyWith(
        myBalance: double.parse(formGroup.amount.controller.text));

    var res = await walletCubit.addCrypto(crypto);

    if (res) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.walletRoutes.wallet,
        (Route<dynamic> route) => false,
      );
    }
  }

  void dispose() {
    formGroup.amount.controller.dispose();
  }
}
