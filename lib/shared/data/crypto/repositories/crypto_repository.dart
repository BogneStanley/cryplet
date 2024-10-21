import 'package:cryplet/core/errors/failure.dart';
import 'package:cryplet/core/exceptions/api_exception.dart';
import 'package:cryplet/core/utils/custom_types.dart';
import 'package:cryplet/shared/data/crypto/api/crypto_local_api.dart';
import 'package:cryplet/shared/data/crypto/api/crypto_remote_api.dart';
import 'package:cryplet/shared/data/crypto/models/crypto_currency_model.dart';
import 'package:cryplet/shared/data/crypto/models/history_data_item_model.dart';
import 'package:dartz/dartz.dart';

class CryptoRepository {
  final CryptoRemoteApi _cryptoRemoteApi;
  final CryptoLocalApi _cryptoLocalApi;

  CryptoRepository(this._cryptoRemoteApi, this._cryptoLocalApi);

  ResultFuture<List<CryptoCurrencyModel>> getCryptoList() async {
    try {
      final res = await _cryptoRemoteApi.getCryptoList();

      return Right(res);
    } on ApiException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  ResultFuture<List<HistoryDataItemModel>> getHistory(String id,
      {String? vsCurrency, String? days}) async {
    try {
      final res = await _cryptoRemoteApi.getCryptoHistory(
        id,
        vsCurrency: vsCurrency ?? 'usd',
        days: days,
      );
      return Right(res);
    } on ApiException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  ResultFuture<List<CryptoCurrencyModel>> getLocalCryptoWalletList() async {
    try {
      final res = _cryptoLocalApi.getWalletCrypto();
      return Right(res);
    } catch (e) {
      return const Left(
          APIFailure(message: 'Failed to retrieve local crypto wallet list'));
    }
  }

  ResultFuture<void> saveLocalCryptoWallet(
      List<CryptoCurrencyModel> wallet) async {
    try {
      _cryptoLocalApi.saveWalletCrypto(wallet);
      return const Right(null);
    } catch (e) {
      return const Left(
          APIFailure(message: 'Failed to save local crypto wallet'));
    }
  }

  ResultFuture<void> updateLocalCryptoInWallet(
      CryptoCurrencyModel crypto) async {
    try {
      _cryptoLocalApi.updateCryptoInWallet(crypto);
      return const Right(null);
    } catch (e) {
      return const Left(
          APIFailure(message: 'Failed to update local crypto in wallet'));
    }
  }

  ResultFuture<void> deleteLocalCryptoInWallet(
      CryptoCurrencyModel crypto) async {
    try {
      _cryptoLocalApi.deleteCryptoInWallet(crypto);
      return const Right(null);
    } catch (e) {
      return const Left(
          APIFailure(message: 'Failed to delete local crypto in wallet'));
    }
  }

  ResultFuture<void> clearLocalCryptoWallet() async {
    try {
      _cryptoLocalApi.clearWallet();
      return const Right(null);
    } catch (e) {
      return const Left(
          APIFailure(message: 'Failed to clear local crypto wallet'));
    }
  }
}
