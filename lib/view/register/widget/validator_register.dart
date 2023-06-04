class UsernameValidatorSignUp {
  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username cannot be blank';
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(username)) {
      return 'Username must be alphabetical only';
    } else if (username.length < 3 || username.length > 25) {
      return 'Username must be between 3-25 characters';
    }
    return null;
  }
}

class EmailValidatorSignup {
  static String? validateEmailSignUp(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email address is Required';
    }
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailPattern);
    if (!regex.hasMatch(email)) {
      return 'Please enter a valid email address.';
    } else if (email == email) {
      return 'Email address is already registered.';
    }
    return null;
  }
}

class ConfirmPasswordValidator {
  static String? validateConfirmPw(String? confirmPw, String password) {
    if (confirmPw == null || confirmPw.isEmpty) {
      return 'Password is required';
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
