import 'package:flutter/material.dart';
import 'package:gofit_apps/model/apis/service_api.dart';
import '../model/login.dart';
import '../model/membership.dart';
import '../model/plan_member.dart';
import 'login_provider.dart';

class PlanProvider extends ChangeNotifier {
  final ApiGym _api = ApiGym();
  List<PlanMember> _planMember = [];
  List<PlanMember> get planMember => _planMember;
  List<DataMember> _membershipData = [];
  List<DataMember> get membershipData => _membershipData;
  DataMember? _plan;
  DataMember? get plan => _plan;
  bool isLoading = false;
  String error = '';
  String? _token;
  String? get token => _token;
  final LoginProvider loginProvider = LoginProvider();

  List<UserLogin> _userLogin = [];
  List<DataMember> _activeDataMembers = [];
  bool _isMember = false;
  bool get isMember => _isMember;

  List<UserLogin> get userLogin => _userLogin;
  List<DataMember> get activeDataMembers => _activeDataMembers;

  Future<void> fetchDataPlan() async {
    try {
      _planMember = await _api.getAllPlans();

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchData() async {
    _userLogin = await _api.fetchUserLogin();
    _planMember = await _api.fetchPlanMember();
    _activeDataMembers = await _api.fetchDataMember();

    notifyListeners();
  }

  Future<void> fetchUserMembership() async {
    final token = await loginProvider.getToken();
    _token = token;

    try {
      final membership = await ApiGym.getUserMembership(token!);
      _membershipData = membership;
      notifyListeners();
    } catch (error) {
      print('Error fetching user membership: $error');
      // Handle error accordingly
    }
  }

  Future<void> login(String email, String password) async {
    // Lakukan proses login dan dapatkan token
    final token = await _performLogin(email, password);
    _token = token;

    // Periksa keanggotaan pengguna berdasarkan token
    final membershipService = ApiGym();
    final isMember = await membershipService.checkMembership(token);
    _isMember = isMember;

    notifyListeners();
  }

  Future<String> _performLogin(String email, String password) async {
    // Lakukan proses login menggunakan email dan password

    // Kembalikan token yang diperoleh setelah login berhasil
    return 'example_token';
  }
}
