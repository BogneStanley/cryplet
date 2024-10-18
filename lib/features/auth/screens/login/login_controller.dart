part of 'login_screen.dart';

class _LoginController extends ScreenControllerContract {
  _LoginController(BuildContext context) : super(context: context);

  final formGroup = (
    formKey: GlobalKey<FormState>(),
    email: AppFormControl<String>(
      validators: [AppFormValidators.required, AppFormValidators.minLength(8)],
    ),
    password: AppFormControl<String>(
      validators: [AppFormValidators.required, AppFormValidators.minLength(8)],
    ),
  );

  void goToRegisterScreen() =>
      Navigator.pushNamed(context, AppRoutes.authRoutes.register);

  dispose() {
    formGroup.email.controller.dispose();
    formGroup.password.controller.dispose();
  }
}
