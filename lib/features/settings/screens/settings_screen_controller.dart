part of 'settings_screen.dart';

class _SettingsScreenController extends ScreenControllerContract {
  _SettingsScreenController({required super.context});

  UserModel get user => context.read<AuthCubit>().state.user!;

  logout() {
    context.read<AuthCubit>().logout();
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.authRoutes.login,
      (route) => false,
    );
  }
}
