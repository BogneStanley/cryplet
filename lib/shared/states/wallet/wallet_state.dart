part of 'wallet_cubit.dart';

class WalletState {
  List<CryptoCurrencyModel> walletCrypto;
  final bool isLoading;
  final String? errorMessage;
  final bool hideAmount;

  WalletState({
    required this.walletCrypto,
    this.isLoading = false,
    this.errorMessage,
    this.hideAmount = false,
  });

  WalletState copyWith({
    List<CryptoCurrencyModel>? walletCrypto,
    bool? isLoading,
    String? errorMessage,
    bool? hideAmount,
  }) {
    return WalletState(
      walletCrypto: walletCrypto ?? this.walletCrypto,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      hideAmount: hideAmount ?? this.hideAmount,
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
