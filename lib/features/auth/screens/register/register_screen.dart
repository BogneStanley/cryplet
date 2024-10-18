import 'package:cryplet/core/contracts/screen_controller_contract.dart';
import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/core/routes/app_routes.dart';
import 'package:cryplet/core/utils/forms/app_form_control.dart';
import 'package:cryplet/core/utils/forms/app_form_validator.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/widgets/app_buttons/app_button.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:cryplet/shared/widgets/text_field/app_password_field.dart';
import 'package:cryplet/shared/widgets/text_field/app_text_field.dart';
import 'package:flutter/material.dart';

part 'register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final _RegisterController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = _RegisterController(context);
  }

  @override
  void dispose() {
    super.dispose();
    _ctrl.dispose();
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
                const FlutterLogo(size: 80),
                40.ph,
                const AppTitle('Create Account').title1(),
                40.ph,
                Form(
                  child: ListBody(
                    children: [
                      AppTextField(
                        label: 'Name',
                        controller: _ctrl.formGroup.name.controller,
                        validator: _ctrl.formGroup.name.validate,
                      ),
                      20.ph,
                      AppTextField(
                        label: 'Email',
                        controller: _ctrl.formGroup.email.controller,
                        validator: _ctrl.formGroup.email.validate,
                      ),
                      20.ph,
                      AppPasswordField(
                        label: 'Password',
                        controller: _ctrl.formGroup.password.controller,
                        validator: _ctrl.formGroup.password.validate,
                      ),
                      20.ph,
                      AppPasswordField(
                        label: 'Confirm Password',
                        controller: _ctrl.formGroup.passwordConfirm.controller,
                        validator: _ctrl.passwordConfirmValidate,
                      ),
                    ],
                  ),
                ),
                40.ph,
                AppButton(label: 'Create Account', onPressed: () {}),
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
                  label: 'Login',
                  onPressed: () => Navigator.pop(context),
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
