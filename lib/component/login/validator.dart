class EmailValidatorLogin {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'This Field is Required';
    }
    String emailPattern = 'mervin.km@gmail.com'; //email yang terdaftar ketika register, misal (mervin.km@gmail.com)
    RegExp regex = RegExp(emailPattern);
    if (!regex.hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }
}

class PasswordValidatorLogin {
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'This field is required';
    }
    String passwordPattern = 'Mervinkm21'; //password yang terdaftar ketika register, misal (Mervinkm21)
    RegExp regex = RegExp(passwordPattern);
    if (!regex.hasMatch(password)) {
      return 'Password is not correct.';
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
