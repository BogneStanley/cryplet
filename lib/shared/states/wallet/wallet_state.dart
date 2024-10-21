part of 'wallet_cubit.dart';

class WalletState {
  List<CryptoCurrencyModel> walletCrypto;
  final bool isLoading;
  final String? errorMessage;

  WalletState(
      {required this.walletCrypto, this.isLoading = false, this.errorMessage});

  WalletState copyWith(
      {List<CryptoCurrencyModel>? walletCrypto,
      bool? isLoading,
      String? errorMessage}) {
    return WalletState(
      walletCrypto: walletCrypto ?? this.walletCrypto,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  double get totalBalance {
    return walletCrypto.isEmpty
        ? 0
        : walletCrypto
            .map((e) => (e.currentPrice ?? 0) * (e.myBalance ?? 0))
            .reduce((value, element) => value + element);
  }

  List<CryptoCurrencyModel> get favoriteCrypto =>
      walletCrypto.where((element) => element.isFavorite ?? false).toList();
}
