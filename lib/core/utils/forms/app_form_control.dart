import 'package:flutter/material.dart';

import '../custom_types.dart';

class AppFormControl<T> {
  T? value;
  List<ValidatorFunction>? validators;
  late TextEditingController controller;

  AppFormControl({this.value, this.validators}) {
    controller = TextEditingController(text: value?.toString());
  }

  // Validate the form control using the provided validators
  String? validate(String? value) {
    if (validators != null) {
      for (var validator in validators!) {
        final error = validator(controller.text);
        if (error != null) {
          return error;
        }
      }
    }
    return null;
  }

  dispose() {
    controller.dispose();
  }
}
