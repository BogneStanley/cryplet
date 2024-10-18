part of 'register_screen.dart';

class _RegisterController extends ScreenControllerContract {
  _RegisterController(BuildContext context, Function(VoidCallback)? setState)
      : super(context: context, setState: setState);

  AuthCubit get authCubit => context.read<AuthCubit>();
  AuthState get authState => context.watch<AuthCubit>().state;

  File? avatar;

  void pickAvatar() async {
    avatar = await ImageHandler.pickFromGallery();
    updateUi();
  }

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

  String? passwordConfirmValidate(String? value) =>
      AppFormValidators.confirmPassword(
        formGroup.password.controller.text,
      )(value);

  void register() async {
    if (authCubit.state.registerInProgess) return;
    if (!(formGroup.formKey.currentState?.validate() ?? false)) return;
    String? error = await authCubit.register(
      name: formGroup.name.controller.text,
      email: formGroup.email.controller.text,
      password: formGroup.password.controller.text,
      passwordConfirm: formGroup.passwordConfirm.controller.text,
      avatar: avatar?.path,
    );

    if (error != null) {
      AppMessageDialog.showError(
        context: context,
        message: error,
      );
    } else {
      await AppMessageDialog.showSuccess(
        context: context,
        message: 'Account created successfully',
      );

      Navigator.pop(context);
    }
  }

  void goToLoginScreen() =>
      Navigator.pushNamed(context, AppRoutes.authRoutes.register);

  dispose() {
    formGroup.name.controller.dispose();
    formGroup.email.controller.dispose();
    formGroup.password.controller.dispose();
    formGroup.passwordConfirm.controller.dispose();
  }
}
