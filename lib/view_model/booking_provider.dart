import 'dart:developer';
import 'dart:math' show asin, atan2, cos, min, pi, pow, sin, sqrt;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gofit_apps/model/apis/service_api.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/apis/tiket_class_models.dart';
import '../model/booking.dart';
import '../model/detail_tiket_models.dart';
import '../model/tiket_class_booking.dart';

enum RequestState { empty, loading, loaded, error }

class BookingProvider extends ChangeNotifier {
  DataClass? _dataClass;
  DataClass? get dataClass => _dataClass;
  List<ClassPackage> _packages = [];
  List<ClassPackage> get packages => _packages;
  // explore screen (class)
  String statusPencarian = "";
  String statusPencarianLokasi = "";
  List<DataClass> _alClass = [];
  List<DataClass> get allClass => _alClass;
  String? _token;
  String? get token => _token;
  int? statusCode = 0;
  String getLinkPay = '';
// single class pakcage sukses
  Response? _tiketClass;
  Response? get tiketClass => _tiketClass;

  Ticket? _tiket;
  Ticket? get tiket => _tiket;
  ClassTicketDetail? _tiketDetail;
  ClassTicketDetail? get tiketDetail => _tiketDetail;

  List<DataDetailBooking> _allBoking = [];
  List<DataDetailBooking> get allBooking => _allBoking;

  RequestState _requestState = RequestState.empty;
  RequestState get requestState => _requestState;

  List<DataClass> searchResults = [];
  List<Map<String, dynamic>> filteredWaktu = [];
  //class fungsi

  // booking tiket class
  Future<void> createBookingClass(
      {int? classId, int? userId, int? packageId}) async {
    try {
      _token = await getToken();
      notifyListeners();
      print('tokenmu ${token}');
      print(
        'classId: ${classId}, packageId: ${packageId}',
      );
      final result = await ApiGym.createClassBooking(
          classId: classId, userId: userId, packageId: packageId, token: token);
      statusCode = result['metadata']['status_code'];
      _tiket = Ticket.fromJson(result);
      print('ini tiket id ${tiket!.data?.id}}');
      print('ini pay nya ${tiket!.transactionInfo!.transactionLink}}');

      print("status kode saat ini adalah $statusCode");

      print("status Code: $statusCode");

      notifyListeners();

      if (statusCode == 201) {
        print("Transaction Link: $getLinkPay");
        notifyListeners();
      } else {}

      notifyListeners();
    } catch (e) {
      print(e);
    }
    print(statusCode.toString());
    notifyListeners();
  }

  Future<void> payTiketClass(
      {String? linkPay,
      String? numberCard,
      String? expiredMonth,
      String? cvv,
      String? typePembayaran}) async {
    try {
      if (statusCode == 201) {
        // /transactions/pay/TM52
        print(
            "linkPay : $linkPay, numberCard : $numberCard, exp: $expiredMonth, cvv: $cvv, typePem : $typePembayaran");
        final res = await ApiGym.payTransaksiClass(
            urlLinktoBookingPlan: linkPay.toString(),
            token: token.toString(),
            typePembayaran: "credit_card",
            // typePembayaran: hapusSpasiCard,
            expireMonth: int.parse(expiredMonth.toString()),
            numberCard: int.parse(numberCard.toString()),
            cvv: int.parse(cvv.toString()));
        notifyListeners();

        // print('tiket class id payyed ${tiketClass?.id}');
        print('is ${tiketClass!.data!.amount}');
        notifyListeners();
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> getClassTiketById({int? classPackageIdBooked}) async {
    _requestState = RequestState.loading;
    notifyListeners();
    print(classPackageIdBooked);
    print('is token ; ${token.toString()}');

    try {
      final res = await ApiGym.getTiketClassBooked(
          classPackageIdBooked: classPackageIdBooked, token: token);
      _tiketDetail = ClassTicketDetail.fromJson(res);

      log('id class: ${classPackageIdBooked.toString()}');
      log('tiketDetail: ${tiketDetail!.data.classPackage!.classInfo!.classType}');
      log('tiketDetail: ${tiketDetail!.data.classPackage!.classInfo!.imageBanner}');

      _requestState = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      _requestState = RequestState.error;
      notifyListeners();
      print(e);
      throw "Cant get tike by Id";
    }
    notifyListeners();
  }

  Future<void> getAllBooking() async {
    print("ok");

    // _requestState = RequestState.loading;
    // notifyListeners();
    _token = await getToken();
    try {
      _allBoking = await ApiGym.getAllBooking(token: token);
      print(allBooking.length);
      for (var element in allBooking) {
        print('this name: ${element.classPackage!.classInfo!.classType}');
      }
      notifyListeners();
    } catch (e) {
      // _requestState = RequestState.error;
      notifyListeners();
      print(e);
      throw "Cant get data";
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    return _token;
  }

  Future<void> bookingDetail({idBooking}) async {
    print("ok");
    /* mas abet & rouf 
    kita nyusun startegi dulu, soalnya dari BE untuk bagian ini masih ngambang
    */
    _requestState = RequestState.loading;
    notifyListeners();
    var token = "ok";
    try {
      final result = await ApiGym.detailBookingById(id: idBooking);
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
    } catch (e) {
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
      // cek waktunya hehe

      /* info gaes ini buat ngecem sekaligus jumper field ke models yaitu "isWaktu"
      patokannya adalah kalo  08:00:12 adalah pagi
      */
      _alClass = _alClass.map((dataClass) {
        // Ambil waktu string dari dataClass.startedAt
        String startedAtStr = dataClass.startedAt.toString();
        DateTime startedAt =
            DateFormat("yyyy-MM-dd HH:mm:ss").parse(startedAtStr);
        String periode;

        if (startedAt.hour >= 5 && startedAt.hour < 12) {
          periode = "pagi";
        } else if (startedAt.hour >= 12 && startedAt.hour < 18) {
          periode = "siang";
        } else {
          periode = "malam";
        }
        List<ClassPackage> updatedClassPackages =
            dataClass.classPackages.map((package) {
          return ClassPackage(
            id: package.id,
            period: package.period,
            price: package.price,
            classId: package.classId,
            status: "false",
            metadata: package.metadata,
          );
        }).toList();

        int minPrice = updatedClassPackages.isNotEmpty
            ? updatedClassPackages.first.price ?? 0
            : 0;
        int maxPrice = updatedClassPackages.isNotEmpty
            ? updatedClassPackages.first.price ?? 0
            : 0;

        for (var package in updatedClassPackages) {
          int price = package.price ?? 0;
          minPrice = price < minPrice ? price : minPrice;
          maxPrice = price > maxPrice ? price : maxPrice;
        }

        return DataClass(
          name: dataClass.name,
          classType: dataClass.classType,
          startedAt: dataClass.startedAt,
          isWaktu: periode,
          classPackages: dataClass.classPackages,
          description: dataClass.description,
          id: dataClass.id,
          link: dataClass.link,
          location: dataClass.location,
          metadata: dataClass.metadata,
          priceRange: maxPrice - minPrice,
          imageBanner: dataClass.imageBanner,
        );
      }).toList();
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
      for (var element in allClass) {
        print(
            'this name: ${element.name}, isWaktu: ${element.isWaktu} ihRange: ${element.priceRange}');
      }
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

  void searchByName(
    String query,
  ) {
    print("mencari $query");
    List<DataClass> results = _alClass
        .where((dataClass) => (dataClass.name
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            dataClass.classType.toLowerCase().contains(query.toLowerCase()) ||
            dataClass.startedAt.toString().contains(query.toLowerCase())))
        .toList();
    searchResults = results;
    statusPencarian = query;
    notifyListeners();
    print('ini lenght ${searchResults.length}');
    for (var element in searchResults) {
      print(
          'kamu nyari ${element.name.toString()} \n ada di ${element.location.city.toString()}');
    }
  }

  void searchByLoc(
    String query,
  ) {
    print("mencari $query");
    List<DataClass> results = _alClass
        .where((dataClass) => (dataClass.location.city!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            dataClass.location.address!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            dataClass.location.name!
                .toLowerCase()
                .contains(query.toLowerCase())))
        .toList();
    searchResults = results;
    statusPencarianLokasi = query;

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

  void searchByBoxChips(String query) {
    print("mencari $query");
    List<DataClass> results = _alClass
        .where((dataClass) =>
            (dataClass.isWaktu.toString().contains(query.toLowerCase())))
        .toList();
    searchResults = results;
    // statusPencarian = query;
    notifyListeners();
    for (var element in searchResults) {
      print(
          'kamu mencari clas ${element.name.toString()} dengan waktu  ${element.isWaktu.toString()} ');
    }
  }

  // filter page

  List<DataClass> searchByPriceRange(minPrice, maxPrice) {
    //
    var hasilKurang = maxPrice - minPrice;
    print('adalah $hasilKurang');

    print("Kelas dalam rentang harga $minPrice - $maxPrice:");

    searchResults = allClass
        .where((dataClass) =>
            dataClass.priceRange <= hasilKurang ||
            dataClass.priceRange == hasilKurang ||
            dataClass.classPackages[0].price! == hasilKurang ||
            dataClass.classPackages[1].price! == hasilKurang ||
            dataClass.classPackages[2].price! == hasilKurang ||
            dataClass.classPackages[0].price! == minPrice ||
            dataClass.classPackages[1].price! == minPrice ||
            dataClass.classPackages[2].price! == minPrice)
        .toList();
    for (var dataClass in searchResults) {
      print('Kelas: ${dataClass.name}, Price Range: ${dataClass.priceRange}');
    }
    return searchResults;

//
  }

  void searchChip(String query) {
    print("mencari $query");
    if (query != "All") {
      List<DataClass> results = _alClass
          .where((dataClass) =>
              (dataClass.classType.toString().contains(query.toLowerCase()) ||
                  dataClass.location.city.toString().contains(query)))
          .toList();
      searchResults = results;
      // statusPencarian = query;
      notifyListeners();
      for (var element in searchResults) {
        print(
            'kamu mencari clas ${element.name.toString()} dengan waktu  ${element.isWaktu.toString()} ');
      }
    } else {
      List<DataClass> onlineResults = _alClass
          .where((dataClass) => dataClass.classType.toLowerCase() == "online")
          .toList();

      List<DataClass> offlineResults = _alClass
          .where((dataClass) => dataClass.classType.toLowerCase() == "offline")
          .toList();

      searchResults = [...onlineResults, ...offlineResults];
      notifyListeners();

      for (var element in searchResults) {
        print(
            'kamu mencari clas ${element.name.toString()} dengan waktu  ${element.isWaktu.toString()}');
      }
    }
  }
}
