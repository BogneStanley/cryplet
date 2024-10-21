import 'package:bloc/bloc.dart';
import 'package:cryplet/shared/data/crypto/models/crypto_currency_model.dart';
import 'package:cryplet/shared/data/crypto/models/history_data_item_model.dart';
import 'package:cryplet/shared/data/crypto/repositories/crypto_repository.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final CryptoRepository _cryptoRepository;

  WalletCubit(this._cryptoRepository) : super(WalletState(walletCrypto: [])) {
    getWalletCrypto();
  }

  void getWalletCrypto() async {
    emit(state.copyWith(isLoading: true));
    final wallet = await _cryptoRepository.getLocalCryptoWalletList();
    wallet.fold((l) {
      emit(state.copyWith(isLoading: false, errorMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          walletCrypto: r, isLoading: false, errorMessage: null));
    });
  }

  Future<bool> addCrypto(CryptoCurrencyModel crypto) async {
    final wallet = state.walletCrypto;
    wallet.add(crypto);
    emit(state.copyWith(isLoading: true));
    var res = await _cryptoRepository.saveLocalCryptoWallet(wallet);

    return res.fold((l) {
      emit(state.copyWith(errorMessage: l.message, isLoading: false));
      return false;
    }, (r) {
      emit(state.copyWith(
          walletCrypto: wallet, isLoading: false, errorMessage: null));

      return true;
    });
  }

  Future<bool> removeCrypto(CryptoCurrencyModel crypto) async {
    final wallet = state.walletCrypto;
    wallet.removeWhere((e) => e.id == crypto.id);
    emit(state.copyWith(isLoading: true));
    var res = await _cryptoRepository.saveLocalCryptoWallet(wallet);

    return res.fold((l) {
      emit(state.copyWith(errorMessage: l.message, isLoading: false));
      return false;
    }, (r) {
      emit(state.copyWith(
          walletCrypto: wallet, isLoading: false, errorMessage: null));

      return true;
    });
  }

  Future<bool> updateCrypto(CryptoCurrencyModel crypto) async {
    final wallet = state.walletCrypto;
    var newWallet = wallet.map((e) {
      if (e.id == crypto.id) {
        e = crypto;
      }
      return e;
    }).toList();
    emit(state.copyWith(isLoading: true));
    var res = await _cryptoRepository.saveLocalCryptoWallet(newWallet);

    return res.fold((l) {
      emit(state.copyWith(errorMessage: l.message, isLoading: false));
      return false;
    }, (r) {
      emit(state.copyWith(
          walletCrypto: newWallet, isLoading: false, errorMessage: null));
      return true;
    });
  }

  Future<List<HistoryDataItemModel>?> getHistory(String id) async {
    final res = await _cryptoRepository.getHistory(id, days: '1');
    return res.fold(
      (l) => null,
      (r) => r,
    );
  }

  void toggleHideAmount() {
    emit(state.copyWith(hideAmount: !state.hideAmount));
  }
}
