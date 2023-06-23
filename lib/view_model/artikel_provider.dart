import 'package:flutter/foundation.dart';
import 'package:gofit_apps/model/apis/service_api.dart';
import 'package:gofit_apps/model/public_api.dart';

class ArtikelProvider extends ChangeNotifier {
  final ApiGym apiNews = ApiGym();
  List<Article> _artikel = [];
  List<Article> get artikel => _artikel;
  final List<Article> _filteredArtikel = [];
  List<Article> get filteredArtikel => _filteredArtikel;
  bool isLoading = false;
  String error = '';

  Future<void> fetchArtikel() async {
    isLoading = true;
    notifyListeners();

    try {
      _artikel = await apiNews.getArtikel();
      // isLoading = false;
      error = '';
      // print(_artikel.length);
      // for (var element in _artikel) {
      //   print(element.title);
      // }
      notifyListeners();
    } catch (e) {
      error = 'Failed to fetch news letters.';
      isLoading = false;
    }
  }

  void search(String text) {}
}
