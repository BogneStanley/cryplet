import 'package:cryplet/core/services/app_storage_service.dart';
import 'package:cryplet/shared/data/crypto/models/crypto_currency_model.dart';

class CryptoLocalApi {
  final String _walletKey = 'wallet';

  void saveWalletCrypto(List<CryptoCurrencyModel> wallet) {
    AppStorageService.write(_walletKey, wallet.map((e) => e.toJson()).toList());
  }

  List<CryptoCurrencyModel> getWalletCrypto() {
    return List<CryptoCurrencyModel>.from(
      (AppStorageService.read<List>(_walletKey))?.map(
            (e) => CryptoCurrencyModel.fromJson(e),
          ) ??
          [],
    );
  }

  void updateCryptoInWallet(CryptoCurrencyModel crypto) {
    final wallet = getWalletCrypto();
    final index = wallet.indexWhere((e) => e.id == crypto.id);
    if (index > -1) {
      wallet[index] = crypto;
    }
    saveWalletCrypto(wallet);
  }

  void deleteCryptoInWallet(CryptoCurrencyModel crypto) {
    final wallet = getWalletCrypto();
    final index = wallet.indexWhere((e) => e.id == crypto.id);
    if (index > -1) {
      wallet.removeAt(index);
    }
    saveWalletCrypto(wallet);
  }

  void clearWallet() {
    saveWalletCrypto([]);
  }
}
