part of '../currency_details_screen.dart';

class _CurrencyDetailsScreenController extends ScreenControllerContract {
  _CurrencyDetailsScreenController({
    required this.id,
    required super.context,
    super.setState,
  }) {
    getHistory();
    init();
  }

  final String id;

  CryptoCurrencyModel get currency =>
      walletCubit.state.walletCrypto.firstWhere((element) => element.id == id);

  List<HistoryDataItemModel> history = [];
  bool dataIsLoading = false;

  final formGroup = (
    formKey: GlobalKey<FormState>(),
    amount: AppFormControl<String>(
      validators: [AppFormValidators.required],
    ),
  );

  init() {
    formGroup.amount.controller.text = currency.myBalance.toString();
  }

  hideAmount() {
    walletCubit.toggleHideAmount();
    updateUi();
  }

  String get balance => walletCubit.state.hideAmount
      ? '****'
      : '${currency.myBalance?.toString() ?? '0'} ${currency.symbol?.toUpperCase() ?? ''}';

  String get usdBalance => walletCubit.state.hideAmount
      ? '**** USD'
      : '${((currency.myBalance ?? 0) * (currency.currentPrice ?? 0)).to2Decimal} USD';

  void showUpdateBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SmoothClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          smoothness: 1.0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            color: AppColors.white,
            height: 200,
            child: Form(
              key: formGroup.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppTextField(
                    controller: formGroup.amount.controller,
                    validator: formGroup.amount.validate,
                    label: 'Balance',
                  ),
                  20.ph,
                  AppButton(
                    label: 'Update',
                    onPressed: () {
                      updateCurrencyBalance();
                      Navigator.pop(context);
                    },
                  ),
                  10.ph,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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

  void updateCurrencyBalance() async {
    if (!formGroup.formKey.currentState!.validate()) {
      return;
    }
    CryptoCurrencyModel crypto = currency.copyWith(
        myBalance: double.parse(formGroup.amount.controller.text));

    var res = await walletCubit.updateCrypto(crypto);

    if (res) {
      updateUi();
    }
  }

  void deleteCurrency() async {
    final res = await walletCubit.removeCrypto(currency);

    if (res) {
      Navigator.pop(context);
    }
  }

  void addCurrencyToFavorite() async {
    final crypto = currency.copyWith(
      isFavorite: !(currency.isFavorite ?? false),
    );
    final res = await walletCubit.updateCrypto(crypto);

    if (res) {
      updateUi();
    }
  }

  dispose() {
    formGroup.amount.controller.dispose();
  }
}
