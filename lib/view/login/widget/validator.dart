class EmailValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'This Field is Required';
    }
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailPattern);
    if (!regex.hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }
}

class PasswordValidator {
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'This field is required';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least 1 uppercase letter';
    } else if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least 1 lowercase letter';
    } else if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least 1 digit';
    }
    return null;
  }
}
