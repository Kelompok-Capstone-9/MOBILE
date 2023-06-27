import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gofit_apps/model/apis/service_api.dart';
import 'package:gofit_apps/model/public_api.dart';
import 'package:gofit_apps/view/article/artikel_screen.dart';

class ArtikelProvider extends ChangeNotifier {
  final ApiGym apiNews = ApiGym();
  List<Article> _artikel = [];
  List<Article> get artikel => _artikel;
  List<Article> filteredArtikel = [];
  bool isLoading = false;
  String error = '';

  Future<void> fetchArtikel() async {
    //isLoading = true;
    notifyListeners();

    try {
      var res = await apiNews.getArtikel();
      PublicApi publicApi = PublicApi.fromJson(res);
      _artikel = publicApi.articles;
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

  void search(String keyword) {
    filteredArtikel = keyword.isEmpty
        ? artikel
        : artikel
            .where((artikel) =>
                artikel.source.name
                    .toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ||
                artikel.title.toLowerCase().contains(keyword.toLowerCase()))
            .toList();

    notifyListeners();
  }
}
