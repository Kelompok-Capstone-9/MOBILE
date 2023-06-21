import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:gofit_apps/model/apis/service_api.dart';
import 'package:gofit_apps/model/register.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/plan.dart';
import 'login_provider.dart';

enum RequestState { empty, loading, loaded, error }

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
  Data? _level;
  Data? get level => _level;
  String? _token;
  String? get token => _token;
  int? statusCode = 0;

  RequestState _requestState = RequestState.empty;
  RequestState get requestState => _requestState;

  String _message = '';
  String get message => _message;

  List<PlanData> _planList = [];

  List<PlanData> get planList => _planList;
  ApiGym _apiService = ApiGym();

  bool isLoading = false;
  String error = '';
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

  void getLevelUser({Data? level}) {
    _level = level;
    notifyListeners();

    print(level!.trainingLevel);
  }

  // class fungsi
  Future<void> register(Data data, context) async {
    final prov = Provider.of<LoginProvider>(context, listen: false);
    try {
      final result = await ApiGym.registerUser(data);
      log("login proses");
      final res = await prov.login(
          email: data.email.toString(), password: data.password.toString());
      _token = prov.token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print('tokennya adalah : $token');

      prefs.setString('token', _token!); // Simpan token otentikasi
      print('tokennya adalah : $token');
      notifyListeners();
    } catch (e) {
      print(e);
    }
    // post data
    /* banyak yang harus diperhatikan ya yaitu weight, height, dsb, 
    hati hati dan semangat */
  }

// join member (plan)
  Future<void> joinMember(int idPlan, context) async {
    try {
      print(token);
      final result = await ApiGym.joinMembership(idPlan: idPlan, token: _token);
      statusCode = result;

      notifyListeners();
    } catch (e) {
      print(e);
    }
    log(statusCode.toString());
  }

  Future<void> fetchDataPlanJoin() async {
    try {
      _planList = await _apiService.getAllPlansJoin();

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    return _token;
  }
}
