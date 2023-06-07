import 'package:flutter/foundation.dart';
import 'package:gofit_apps/model/apis/service_api.dart';

import 'package:gofit_apps/model/register.dart';

class RegisterProvider extends ChangeNotifier {
  Data? _dataUser;
  Data? get dataUser => _dataUser;
  String? _name;
  String? get name => _name;
  String? _email;
  String? get email => _email;
  String? _password;
  String? get password => _password;

  void getDataUser({String? name, String? email, String? password}) {
    _name = name;
    _email = email;
    _password = password;

    notifyListeners();
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