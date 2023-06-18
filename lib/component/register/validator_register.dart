import 'package:http/http.dart' as http;

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
    }

    // if (isEmailRegistered(email)) {

    //   return 'Email address is already registered.';
    // }
    return null;
  }

  // static bool isEmailRegistered(String email)  {
  //   String apiUrl = 'http://18.141.56.154:8000/login';

  //   var response =  http.post(Uri.parse(apiUrl), body: {'email': email});

  //   if (response.statusCode == 200) {
  //     var responseData = response.body;

  //     if (responseData == 'email') {
  //       return true; // Email address is already registered
  //     }
  //   }

  //   return false;
  // }
}

class ConfirmPasswordValidator {
  static String? validateConfirmPw(String? confirmPw, String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~?]).{8,25}$';

    // Memeriksa apakah string kosong
    if (confirmPw!.isEmpty || password.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (!confirmPw.contains(RegExp(pattern)) ||
        !password.contains(RegExp(pattern))) {
      return 'Password harus memiliki blabla';
    }

    // Memeriksa panjang string
    if (confirmPw.length < 8 || password.length < 8) {
      return 'Password harus memiliki minimal 8 karakter';
    }

    // Memeriksa adanya satu huruf kapital
    if (!confirmPw.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[A-Z]'))) {
      return 'Password harus memiliki minimal satu huruf kapital';
    }

    if (password != confirmPw) {
      return 'Password tidak sesuai';
    } else {
      return null;
    }
  }

  // static String? validateConfirmPw(String? confirmPw, String password) {
  //   String pattern =
  //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  //   RegExp regExp = RegExp(pattern);

  //   if (confirmPw == null || confirmPw.isEmpty) {
  //     return 'Password is required';
  //   } else if (password != confirmPw) {
  //     return 'The password confirmation does not match';
  //   } else if (!regExp.hasMatch(password)) {
  //     return 'Password should contain 8 characters and include at least one uppercase letter, one lowercase letter, one digit, and one special character (!@#\$&*~)';
  //   } else {
  //     return null;
  //   }
  // }
}
