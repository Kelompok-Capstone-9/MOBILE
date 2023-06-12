import 'package:flutter/foundation.dart';
import 'package:gofit_apps/model/apis/service_api.dart';

import 'package:gofit_apps/model/register.dart';

class RegisterProvider extends ChangeNotifier {
  Data? _dataUser;
  Data? get dataUser => _dataUser;

  void getDataUser({String? name, String? email, String? password}) {
    _dataUser?.name = name;
    _dataUser?.email = email;
    _dataUser?.password = password;

    notifyListeners();
    // print(dataUser!.name);
    // print(dataUser!.email);
    // print(dataUser!.password);
  }

  void getGenderUser({isGender}) {
    dataUser?.gender = isGender;

    notifyListeners();

    // print(isGender);
  }

  void getHeightUser({height}) {
    dataUser?.height = height;

    notifyListeners();
    print(dataUser?.height);
  }

  void getWeightUser({int? weight}) {
    dataUser?.weight = weight;
    notifyListeners();

    print(weight);
  }

  void getWeightGoalUser({int? weightgoal}) {
    dataUser?.goalWeight = weightgoal;
    notifyListeners();

    print(dataUser?.goalWeight);
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