import 'package:bloc/bloc.dart';
import 'package:cryplet/shared/data/crypto/models/crypto_currency_model.dart';
import 'package:cryplet/shared/data/crypto/repositories/crypto_repository.dart';

part 'get_currencies_list_state.dart';

class GetCurrenciesListCubit extends Cubit<GetCurrenciesListState> {
  CryptoRepository _cryptoRepository;
  GetCurrenciesListCubit(this._cryptoRepository)
      : super(GetCurrenciesListState()) {
    getCurrencies();
  }

  Future<void> getCurrencies() async {
    emit(state.copyWith(isLoading: true));

    final res = await _cryptoRepository.getCryptoList();
    res.fold((l) {
      emit(state.copyWith(isLoading: false, errorMessage: l.message));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        currenciesList: r,
        errorMessage: null,
      ));
    });
  }
}
