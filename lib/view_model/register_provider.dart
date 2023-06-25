import 'dart:developer';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:gofit_apps/model/apis/service_api.dart';
import 'package:gofit_apps/model/memberships_models.dart';
import 'package:gofit_apps/model/register.dart';
import 'package:intl/intl.dart';
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
  PlanData? _dataPlan;
  PlanData? get dataPlan => _dataPlan;
  String getLinkPay = '';
  // single pay
  String transactionInfo = '';
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
      print("login proses");
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

  Future<void> fetchDataPlanJoin() async {
    try {
      _planList = await _apiService.getAllPlansJoin();
  
      notifyListeners();
    } catch (error) {
      rethrow;
    }
    notifyListeners();
  }

  // join member (plan)
  Future<void> joinMember({int? idPlan, context}) async {
    try {
      print(token);
      final result = await ApiGym.joinMembership(idPlan: idPlan, token: _token);
      statusCode = result['metadata']['status_code'];
      print("status kode saat ini adalah $statusCode");

      print("Transaction Code: $statusCode");

      notifyListeners();

      if (statusCode == 201) {
        getLinkPay = result['transaction_info']['transaction_link'];
        print("Transaction Link: $getLinkPay");
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
    print(statusCode.toString());
  }

  Future<void> payPlan({String? linkPay}) async {
    try {
      if (statusCode == 201) {
        // /transactions/pay/TM52
        final res = await ApiGym.payPlan(linkPay, token);
        if (res == 200) {
          statusCode = 200;
          notifyListeners();
        }
      } else {}

      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    return _token;
  }

  String generateOTP() {
    Random random = Random();
    int otpLength = 4;
    String otp = '';

    for (int i = 0; i < otpLength; i++) {
      otp += random.nextInt(10).toString();
    }

    return otp;
  }

// save OTP
  Future<void> saveOTPToSharedPreferences(String otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('otp', otp);
  }

// ambil OTP
  Future<String?> getOTPFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('otp');
  }

  void sendOTPByEmail(String email, String otp) async {
    try {
      final sendReport = await _apiService.sendOTP(email, otp);
      print('Message sent: ${sendReport.sent}');
    } catch (e) {
      print('Error sending email: $e');
    }
  }

  Future<void> getPlanDetail({int? idPlan}) async {
    print("ok");
    /* mas abet & rouf 
    kita nyusun startegi dulu, soalnya dari BE untuk bagian ini masih ngambang
    */
    // _requestState = RequestState.loading;
    // notifyListeners();
    var token = "ok";
    try {
      final result = await ApiGym.getPlanById(id: idPlan);
      _dataPlan = PlanData.fromJson(result['data']);

      print('plan diambil $idPlan');
      // _requestState = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      // _requestState = RequestState.error;
      notifyListeners();
      print(e);
      throw "Cant get data Plan";
    }
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM dd, yyyy').format(now);
    return formattedDate;
  }

  String getTanggalPlus({required int ditambah}) {
    DateTime now = DateTime.now();
    DateTime newDate = now.add(Duration(days: ditambah));
    String formattedDate = DateFormat('MMMM dd, yyyy').format(newDate);
    return formattedDate;
  }
}
