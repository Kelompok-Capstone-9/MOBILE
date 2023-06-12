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
  Data? get genderUser => _genderUser;
  Data? _heightUser;
  Data? get heightUser => _heightUser;
  Data? _weightUser;
  Data? get weightUser => _weightUser;
  Data? _weightGoalUser;
  Data? get weightGoalUser => _weightGoalUser;

  void getDataUser({Data? name, Data? email, Data? password}) {
    _name = name;
    _email = email;
    _password = password;

    notifyListeners();
    print(name!.name);
    print(email!.email);
    print(password!.password);
  }

  void getGenderUser({isGender}) {
    _genderUser = isGender;

    notifyListeners();

    print("isGender : ${genderUser!.gender}");
  }

  void getHeightUser({Data? height}) {
    _heightUser = height;

    notifyListeners();
    print(height!.height);
  }

  void getWeightUser({Data? weight}) {
    _weightUser = weight;
    notifyListeners();

    print(weightUser!.weight);
  }

  void getWeightGoalUser({Data? weightgoal}) {
    _weightGoalUser = weightgoal;
    notifyListeners();

    print(weightGoalUser!.goalWeight);
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
