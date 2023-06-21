import 'dart:convert';
import 'dart:developer';
import 'dart:math' show asin, atan2, cos, pi, pow, sin, sqrt;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gofit_apps/model/apis/service_api.dart';

import '../model/booking.dart';

enum RequestState { empty, loading, loaded, error }

class BookingProvider extends ChangeNotifier {
  ApiGym _apiClass = ApiGym();
  DataClass? _dataClass;
  DataClass? get dataClass => _dataClass;
  List<ClassPackage> _packages = [];
  List<ClassPackage> get packages => _packages;
  // explore screen (class)
  List<DataClass> _alClass = [];
  List<DataClass> get allClass => _alClass;

  RequestState _requestState = RequestState.empty;
  RequestState get requestState => _requestState;

  List<DataClass> searchResults = [];
  //class fungsi
  Future<void> bookingDetail({idBooking}) async {
    print("ok");
    /* mas abet & rouf 
    kita nyusun startegi dulu, soalnya dari BE untuk bagian ini masih ngambang
    */
    _requestState = RequestState.loading;
    notifyListeners();
    var token = "ok";
    try {
      final result = await ApiGym.detailBooking(id: idBooking);
      _dataClass = DataClass.fromJson(result['data']);
      _packages = _dataClass!.classPackages.map((package) {
        return ClassPackage(
          id: package.id,
          period: package.period,
          price: package.price,
          classId: package.classId,
          status: "false", // Set status dengan nilai null
          metadata: package.metadata,
        );
      }).toList();
      for (var element in _packages) {
        log(element.status.toString());
      }
      _requestState = RequestState.loaded;
      notifyListeners();
    }

    // _packages = getClassPackages(result);
    //   _packages = _dataClass!.classPackages;

    //   notifyListeners();
    //   // log();
    //   log('data detail dari ${_dataClass!.name} (${_dataClass!.classType})');

    //   print('mendapatkan select package wkwk');

    //   for (var element in _packages) {
    //     log('${element.period.toString()} ==> Rp. ${element.price.toString()}');
    //   }
    // }
    catch (e) {
      _requestState = RequestState.error;
      notifyListeners();
      print(e);
      throw "Cant get data";
    }
  }

  Future<void> getAllClass({tujuanLat, tujuanLong}) async {
    print("ok");

    // _requestState = RequestState.loading;
    // notifyListeners();
    try {
      _alClass = await ApiGym.getAllClass();
      // _alClass = result['data'];

      // _requestState = RequestState.loaded;

      print("is length pencarian : ${searchResults.length}");
      print("is length allclass : ${allClass.length}");
      _packages = _packages.map((package) {
        return ClassPackage(
          id: package.id,
          period: package.period,
          price: package.price,
          classId: package.classId,
          status: "false", // Set status dengan nilai null
          metadata: package.metadata,
        );
      }).toList();
      notifyListeners();
      print(allClass.length);
      for (var element in allClass) {
        print('this name : ${element.name}');
      }
    } catch (e) {
      // _requestState = RequestState.error;
      notifyListeners();
      print(e);
      throw "Cant get data";
    }
  }

  void searchByName(String query) {
    List<DataClass> results = _alClass
        .where((dataClass) =>
            dataClass.name.toLowerCase().contains(query.toLowerCase()) ||
            dataClass.classType.toLowerCase().contains(query.toLowerCase()))
        .toList();

    searchResults = results;
    notifyListeners();
    print('ini lenght ${searchResults.length}');
    for (var element in searchResults) {
      print(
          'kamu nyari ${element.name.toString()} \n ada di ${element.location.city.toString()}');
    }
  }

//  get lokasi
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    // Konversi kedalam radian
    final double dLat = _toRadians(lat2 - lat1);
    final double dLon = _toRadians(lon2 - lon1);

    // Menggunakan rumus Haversine
    final double a = pow(sin(dLat / 2), 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * pow(sin(dLon / 2), 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Radius bumi dalam kilometer
    const double radius = 6371;

    // Menghitung jarak
    final double distance = radius * c;

    return distance;
  }

  double _toRadians(double degree) {
    return degree * (pi / 180);
  }
}
