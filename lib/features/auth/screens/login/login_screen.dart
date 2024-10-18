import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/utils/forms/app_form_control.dart';
import 'package:cryplet/core/utils/forms/app_form_validator.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/states/auth/auth_cubit.dart';
import 'package:cryplet/shared/widgets/app_buttons/app_button.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:cryplet/shared/widgets/dialogs/app_message_dialog.dart';
import 'package:cryplet/shared/widgets/text_field/app_password_field.dart';
import 'package:cryplet/shared/widgets/text_field/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late _LoginController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = _LoginController(context);
  }

  @override
  void dispose() {
    super.dispose();
    ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                40.ph,
                const FlutterLogo(size: 100),
                40.ph,
                const AppTitle('Login').title1(),
                40.ph,
                Form(
                  key: ctrl.formGroup.formKey,
                  child: ListBody(
                    children: [
                      AppTextField(
                        label: 'Email',
                        controller: ctrl.formGroup.email.controller,
                        validator: ctrl.formGroup.email.validate,
                      ),
                      20.ph,
                      AppPasswordField(
                        label: 'Password',
                        controller: ctrl.formGroup.password.controller,
                        validator: ctrl.formGroup.password.validate,
                      ),
                    ],
                  ),
                ),
                40.ph,
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return AppButton(
                      label: 'Login',
                      onPressed: ctrl.login,
                      isLoading: state.loginInProgess,
                    );
                  },
                ),
                10.ph,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      const Expanded(child: Divider()),
                      10.pw,
                      const Text('OR'),
                      10.pw,
                      const Expanded(child: Divider()),
                    ],
                  ),
                ),
                10.ph,
                AppButton(
                  label: 'Create Account',
                  onPressed: ctrl.goToRegisterScreen,
                  bgColor: AppColors.dark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
