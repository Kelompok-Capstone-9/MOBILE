import 'package:flutter/foundation.dart';
import 'package:gofit_apps/model/news_letter.dart';
import 'package:gofit_apps/model/apis/service_api.dart';
import 'package:gofit_apps/model/public_api.dart';

class ArtikelProvider extends ChangeNotifier {
  final ApiGym apiNews = ApiGym();
  List<PublicApi> _artikel = [];
  List<PublicApi> get artikel => _artikel;
  bool isLoading = false;
  String error = '';

  Future<void> fetchArtikel() async {
    isLoading = true;
    notifyListeners();

    try {
      _artikel = await apiNews.getArtikel();
      // isLoading = false;
      error = '';
      print(_artikel.length);
      for (var element in _artikel) {
        print(element.articles);
      }
      notifyListeners();
    } catch (e) {
      error = 'Failed to fetch news letters.';
      isLoading = false;
    }
  }
}
