import 'package:email_validator/email_validator.dart';

class FormValidator {
  validateEmail(String? email) {
    if (email!.isNotEmpty) {
      var isEmailValid = EmailValidator.validate(email);
      if (isEmailValid) {
        return null;
      } else {
        return 'Email is not Valid';
      }
    } else {
      return 'Email is Required';
    }
  }

  validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Enter Password';
    } else {
      if (password.length < 6) {
        return 'Password must have more than 6 characters';
      }
    }
  }

  validateName(String? name) {
    if (name!.isEmpty) {
      return 'Name is Required';
    } else {
      if (name.length < 3) {
        return 'Password must have more than 3 characters';
      }
    }
  }
}
