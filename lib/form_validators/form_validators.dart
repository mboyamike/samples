typedef FormValidator = String? Function(String? textToValidate);

class FormValidators {
  static FormValidator get requiredValidator {
    return (String? textToValidate) {
      if (textToValidate == null || textToValidate.trim().isEmpty) {
        return 'This Field is required';
      }
      return null;
    };
  }

  static FormValidator get emailValidator {
    return (String? textToValidate) {
      if (textToValidate == null) {
        return null;
      }

      bool isEmailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(textToValidate);

      if (!isEmailValid) {
        return 'Please enter a valid email address';
      }

      return null;
    };
  }

  static String? compose({
    required String textToValidate,
    required List<FormValidator> validators,
  }) {
    for (final validator in validators) {
      final errorMessage = validator(textToValidate);

      if (errorMessage != null) {
        return errorMessage;
      }
    }

    return null;
  }
}
