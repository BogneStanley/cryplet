part of 'login_screen.dart';

class _LoginController extends ScreenControllerContract {
  _LoginController(BuildContext context) : super(context: context);

  AuthCubit get bloc => context.read<AuthCubit>();

  final formGroup = (
    formKey: GlobalKey<FormState>(),
    email: AppFormControl<String>(
      validators: [AppFormValidators.required, AppFormValidators.minLength(8)],
    ),
    password: AppFormControl<String>(
      validators: [AppFormValidators.required, AppFormValidators.minLength(8)],
    ),
  );

  Future<void> login() async {
    if (!formGroup.formKey.currentState!.validate()) {
      return;
    }
    await bloc.login(
      email: formGroup.email.controller.text,
      password: formGroup.password.controller.text,
    );

    if (bloc.state.errorMessage != null) {
      AppMessageDialog.showError(
        context: context,
        message: bloc.state.errorMessage!,
      );
    }

    if (bloc.state.user != null) {
      goToHomeScreen();
    }
  }

  void goToRegisterScreen() =>
      Navigator.pushNamed(context, AppRoutes.authRoutes.register);

  void goToHomeScreen() => Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.homeRoutes.home,
        (route) => false,
      );

  dispose() {
    formGroup.email.controller.dispose();
    formGroup.password.controller.dispose();
  }
}
