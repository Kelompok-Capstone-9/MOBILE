import 'package:flutter/foundation.dart';
import 'package:gofit_apps/model/apis/service_api.dart';

import 'package:gofit_apps/model/register.dart';

class RegisterProvider extends ChangeNotifier {
  Data? _dataUser;
  Data? get dataUser => _dataUser;
  Data? _name;
  Data? get name => _name;
  Data? _email;
  Data? get email => _email;
  Data? _password;
  Data? get password => _password;
  Data? _genderUser;
  Data? get isGender => _genderUser;
  int? _heightUser;
  int? get height => _heightUser;
  int? _weightUser;
  int? get weight => _weightUser;
  int? _weightGoalUser;
  int? get weightGoalUser => _weightGoalUser;

  void getDataUser({Data? name, Data? email, Data? password}) {
    _name = name;
    _email = email;
    _password = password;

    notifyListeners();
  }

  void getGenderUser({Data? isGender}) {
    _genderUser = isGender;

    notifyListeners();

    print(isGender);
  }

  void getHeightUser({int? height}) {
    _heightUser = height;

    notifyListeners();
    print(height);
  }

  void getWeightUser({int? weight}) {
    _weightUser = weight;
    notifyListeners();

    print(weight);
  }

  void getWeightGoalUser({int? weightgoal}) {
    _weightGoalUser = weightgoal;
    notifyListeners();

    print(weightGoalUser);
  }

  // class fungsi
  Future<void> register(Data data) async {
    try {
      final result = await ApiGym.registerUser(data);
    } catch (e) {
      print(e);
    }
    // post data
    /* banyak yang harus diperhatikan ya yaitu weight, height, dsb, 
    hati hati dan semangat */
  }
}
// Future<void> addProduct(NewProduct newProduct) async {
//     _requestState = RequestState.loading;
//     notifyListeners();
//     try {
//       final result = await ApiProduct.addProduct(newProduct);
//       _newProducts.add(result);
//       _requestState = RequestState.loaded;
//       notifyListeners();
//     } catch (e) {
//       _requestState = RequestState.error;
//       _message = 'Error: $e';
//       notifyListeners();
//     }
//   }