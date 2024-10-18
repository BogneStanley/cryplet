import '../custom_types.dart';

class AppFormValidators {
  static ValidatorFunction required = (String? value) {
    return (value == null || value.isEmpty) ? 'This field is required' : null;
  };

  static ValidatorFunction minLength(int length) {
    return (String? value) {
      return (value != null && value.length < length)
          ? 'Minimum length is $length characters'
          : null;
    };
  }

  static ValidatorFunction confirmPassword(String password) {
    return (String? value) {
      return (value != null && value != password)
          ? 'Passwords do not match'
          : null;
    };
  }

  static ValidatorFunction email = (String? value) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return (!emailRegex.hasMatch(value ?? '')) ? 'Invalid email address' : null;
  };
}
