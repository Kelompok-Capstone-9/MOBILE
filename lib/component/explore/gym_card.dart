import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gofit_apps/model/gym.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/booking_detail/booking_detail.dart';
import 'package:gofit_apps/view_model/booking_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math' show cos, sqrt, asin;

import '../../model/booking.dart';
import '../booking_detail/convert.dart';

class GymCardList extends StatefulWidget {
  var statusPencarian;

  GymCardList({
    Key? key,
    required this.gymData,
    required this.statusPencarian,
  }) : super(key: key);

  final List<GymData> gymData;

  @override
  State<GymCardList> createState() => _GymCardListState();
}

List<DataClass> searchResults = [];
//
Future<Position?> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Periksa apakah layanan lokasi telah diaktifkan
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Layanan lokasi tidak aktif, lakukan penanganan sesuai kebutuhan aplikasi Anda
    return null;
  }
  // Periksa izin akses lokasi
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    // Pengguna telah secara permanen menolak izin lokasi, tampilkan pesan atau arahkan pengguna ke pengaturan aplikasi
    return null;
  }

  if (permission == LocationPermission.denied) {
    // Ijinkan akses lokasi
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      // Pengguna menolak izin akses lokasi, lakukan penanganan sesuai kebutuhan aplikasi Anda
      return null;
    }
  }
  // Dapatkan posisi saat ini
  Position position = await Geolocator.getCurrentPosition();
  return position;
}

//
class _GymCardListState extends State<GymCardList> {
  // Position? _currentPosition;
  double latitude = 0.0;
  double longitude = 0.0;
  @override
  void initState() {
    super.initState();
    doCall();
    Future.microtask(() =>
        Provider.of<BookingProvider>(context, listen: false).getAllClass());
    final gymProv = Provider.of<BookingProvider>(context, listen: false);
    // print("is length pencarian : ${gymProv.searchResults.length}");
    // print("is length allclass : ${gymProv.allClass.length}");
  }

  Future<void> doCall() async {
    Position? position = await getCurrentLocation();
    if (position != null) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
      print('this $latitude');
      print('this $longitude');
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, gymProv, child) {
        print("Status Pencarian ${gymProv.statusPencarian}");
        // ignore: prefer_is_empty
        if (gymProv.searchResults.length == 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 45),
              SizedBox(
                  width: 130,
                  // height: 180,
                  child: 
                  Image.asset(
                    'assets/images/not-found.png',
                    fit: BoxFit.contain,
                  )).animate().fadeIn(),
              Text(
                "Search not found ",
                style: ThemeText.heading4
                    .copyWith(fontWeight: FontWeight.w600, height: 0),
              ).animate().fadeIn(),
              Center( 
                      child: Text("Please try another search term",
                          style: ThemeText.heading4.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: const Color(0xff919191))))
                  .animate()
                  .fadeIn()
            ],
          );
        }

        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: gymProv.statusPencarian == ''
                ? gymProv.allClass.length
                : gymProv.searchResults.length,
            itemBuilder: (BuildContext context, int index) {
              final gymDataItem = gymProv.statusPencarian == ''
                  ? gymProv.allClass[index]
                  : gymProv.searchResults[index];

              double distance = gymProv.calculateDistance(
                // tujuanLatitude,
                // tujuanLongitude,
                // 45.67,
                // 78.12,
                latitude,
                longitude,
                // -6.1754,
                // 106.8272

                double.parse(gymDataItem.location.latitude.toString() == ""
                    ? "0.0"
                    : gymDataItem.location.latitude.toString()),
                double.parse(gymDataItem.location.longitude.toString() == ""
                    ? "0.0 "
                    : gymDataItem.location.longitude.toString()),
              );
              gymDataItem.location.distance = distance;

              List<ClassPackage> classPackages = gymDataItem.classPackages;
              int? minPrice;
              int? maxPrice;

              if (classPackages.isNotEmpty) {
                minPrice = classPackages[0].price;
                maxPrice = classPackages[0].price;

                for (var package in classPackages) {
                  if (package.price != null) {
                    if (package.price! < minPrice!) {
                      minPrice = package.price;
                    }
                    if (package.price! > maxPrice!) {
                      maxPrice = package.price;
                    }
                  }
                }
              }

              List<String> prices = List.generate(classPackages.length,
                  (index) => 'Harga ${classPackages[index].price}');
              String pricesText = prices.join(', ');
              print(
                  'lokasi anda saat ini ${gymDataItem.location.distance.toString()}');

              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorsTheme.bgScreen,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  minVerticalPadding: 10,
                  leading: Container(
                    height: 60,
                    width: 60,
                    child: Image.network(
                      'http://18.141.56.154:8000/${gymDataItem.imageBanner}',
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset('assets/images/ShopeePay.png');
                      },
                    ),
                  ),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gymDataItem.name,
                            style: ThemeText.heading2,
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () async {
                              setState(() {
                                // var a = hitungJarak(
                                //     double.parse(
                                //         gymDataItem.location.latitude.toString()),
                                //     double.parse(gymDataItem.location.longitude
                                //         .toString()));
                                // Location updatedLocation = Location(
                                //   convertJarak: hitungJarak.toString(),
                                // );
                              });
                            },
                            child: Text(
                              // "jarak ${gymDataItem.location.latitude} ${gymDataItem.location.name}",
                              // " ${gymDataItem.location.convertJarak.toString()}",
                              // "2 Km",

                              gymDataItem.classType == "online"
                                  ? "Zoom, Google Meet"
                                  : '${gymDataItem.location.distance!.toStringAsFixed(1).toString()} km',

                              style: ThemeText.heading4.copyWith(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  overflow: TextOverflow.clip),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${gymDataItem.classType} class",
                            style: ThemeText.heading4.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            // "0",
                            gymDataItem.classPackages.isEmpty
                                ? "package is Disabaled"
                                : '${formatCurrency(minPrice!)} - ${formatCurrencyNonLabel(maxPrice!)}',
                            style: ThemeText.heading2.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingDetail(
                                      id: gymDataItem.id,
                                    )),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorsTheme.accent),
                          child: Text(
                            "Book",
                            style: ThemeText.heading4.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn();
            }).animate().fadeIn();
      },
    );
  }
}
