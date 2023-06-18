import 'package:flutter/foundation.dart';
import 'package:gofit_apps/model/news_letter.dart';
import 'package:gofit_apps/model/apis/service_api.dart';

class NewsLetterProvider extends ChangeNotifier {
  final ApiGym apiNews = ApiGym();
  List<NewsLetter> _artikel = [];
  List<NewsLetter> get artikel => _artikel;
  bool isLoading = false;
  String error = '';

  Future<void> fetchNewsLetter() async {
    isLoading = true;
    notifyListeners();

    try {
      _artikel = await apiNews.getNewsLetter();
      // isLoading = false;
      error = '';
      print(_artikel.length);
      for (var element in _artikel) {
        print(element.judulArtikel);
      }
      notifyListeners();
    } catch (e) {
      error = 'Failed to fetch news letters.';
      isLoading = false;
    }
  }
}
