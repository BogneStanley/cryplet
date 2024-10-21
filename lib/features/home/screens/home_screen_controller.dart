part of 'home_screen.dart';

class _HomeScreenController extends ScreenControllerContract {
  _HomeScreenController({required super.context});

  WalletState get walletState => context.watch<WalletCubit>().state;
  WalletCubit get walletCubit => context.read<WalletCubit>();

  hideAmount() {
    walletCubit.toggleHideAmount();
  }

  UserModel? get user => context.read<AuthCubit>().state.user;

  void goToCurrencyDetails(String id) async {
    Navigator.pushNamed(
      context,
      AppRoutes.walletRoutes.currencyDetails,
      arguments: id,
    );
  }
}
