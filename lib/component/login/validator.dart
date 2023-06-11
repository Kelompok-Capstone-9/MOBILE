import '../../model/login.dart';
import '../../view_model/login_provider.dart';

class EmailValidatorLogin {
  static String? validateEmail(String? email, LoginProvider loginProvider) {
    if (email == null || email.isEmpty) {
      return 'This field is required';
    }

    UserLogin? userLogin = loginProvider.userLogin;
    if (userLogin != null && userLogin.email != email) {
      return 'Please enter a valid email address.';
    }

    return null;
  }
}

class PasswordValidatorLogin {
  static String? validatePassword(
      String? password, LoginProvider? loginProvider) {
    if (password == null || password.isEmpty) {
      return 'This field is required';
    }

    if (loginProvider != null) {
      UserLogin? userLogin = loginProvider.userLogin;
      if (userLogin != null &&
          userLogin.password != null &&
          userLogin.password != password) {
        return 'Password is not correct.';
      }
    }

    return null;
  }
}

class ConfirmPasswordValidator {
  static String? validateConfirmPw(String? confirmPw, String password) {
    if (confirmPw == null || confirmPw.isEmpty) {
      return 'Please enter the password again';
    } else if (password != confirmPw) {
      return 'The password confirmation does not match';
    } else if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!_@#\$%^&])[A-Za-z\d!_@#\$%^&]{8,}$')
        .hasMatch(password)) {
      return 'Password must have at least 8 characters that include at least 1 lowercase character, 1 uppercase character, 1 number, and 1 special character in (!_@#\$%^&)';
    }
    return null;
  }
}
