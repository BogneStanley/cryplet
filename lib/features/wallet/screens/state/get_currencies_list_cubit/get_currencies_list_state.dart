part of 'get_currencies_list_cubit.dart';

class GetCurrenciesListState {
  final bool isLoading;
  final List<CryptoCurrencyModel> currenciesList;
  final String? errorMessage;

  GetCurrenciesListState({
    this.isLoading = false,
    this.currenciesList = const [],
    this.errorMessage,
  });

  GetCurrenciesListState copyWith({
    bool? isLoading,
    List<CryptoCurrencyModel>? currenciesList,
    String? errorMessage,
  }) {
    return GetCurrenciesListState(
      isLoading: isLoading ?? this.isLoading,
      currenciesList: currenciesList ?? this.currenciesList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
