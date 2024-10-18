part of 'register_screen.dart';

class _RegisterController extends ScreenControllerContract {
  _RegisterController(BuildContext context) : super(context: context);

  final formGroup = (
    formKey: GlobalKey<FormState>(),
    name: AppFormControl<String>(
      validators: [
        AppFormValidators.required,
      ],
    ),
    email: AppFormControl<String>(
      validators: [
        AppFormValidators.required,
        AppFormValidators.email,
      ],
    ),
    password: AppFormControl<String>(
      validators: [
        AppFormValidators.required,
        AppFormValidators.minLength(8),
      ],
    ),
    passwordConfirm: AppFormControl<String>(
      validators: [
        AppFormValidators.required,
        AppFormValidators.minLength(8),
      ],
    ),
  );

  String? passwordConfirmValidate(String? value) => (formGroup.passwordConfirm
        ..validators?.add(
          AppFormValidators.confirmPassword(
            formGroup.password.controller.text,
          ),
        ))
      .validate(value);

  void goToLoginScreen() =>
      Navigator.pushNamed(context, AppRoutes.authRoutes.register);

  dispose() {
    formGroup.name.controller.dispose();
    formGroup.email.controller.dispose();
    formGroup.password.controller.dispose();
    formGroup.passwordConfirm.controller.dispose();
  }
}
