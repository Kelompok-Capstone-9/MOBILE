import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:gofit_apps/model/apis/service_api.dart';

import '../model/booking.dart';

enum RequestState { empty, loading, loaded, error }

class BookingProvider extends ChangeNotifier {
  ApiGym _apiClass = ApiGym();
  DataClass? _dataClass;
  DataClass? get dataClass => _dataClass;
  List<ClassPackage> _packages = [];
  List<ClassPackage> get packages => _packages;

  RequestState _requestState = RequestState.empty;
  RequestState get requestState => _requestState;

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
}
