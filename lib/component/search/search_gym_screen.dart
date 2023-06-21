import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/booking_detail/booking_detail.dart';
import 'package:gofit_apps/view/explore/explore_screen.dart';
import 'package:gofit_apps/view_model/booking_provider.dart';
import 'package:provider/provider.dart';

import '../../model/booking.dart';

class SearchGymView extends StatefulWidget {
  var prov;

  SearchGymView(
      {super.key,
      required this.prov,
      required TextEditingController searchByName});

  @override
  State<SearchGymView> createState() => _SearchGymViewState();
}

class _SearchGymViewState extends State<SearchGymView> {
  // final TextEditingController searchController = TextEditingController();
  String searchRes = "";
  List<DataClass> searchResults = [];
  TextEditingController searchController = TextEditingController();
  void searchByName(String query, prov, context) {
    List<DataClass> results =
        Provider.of<BookingProvider>(context, listen: false)
            .searchResults
            .where((dataClass) =>
                dataClass.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    setState(() {
      searchResults = results;

      print(searchResults);
    });
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<BookingProvider>(context, listen: false);

    return Consumer<BookingProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
              elevation: 0.8,
              title: Container(
                width: double.infinity,
                height: 40,
                padding:
                    const EdgeInsets.only(left: 2, right: 2, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  color: ColorsTheme.searchbox,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: TextField(
                    
                    controller: searchController,
                    onChanged: (value) {
                      // widget.searchByName(value);
                      searchRes = value;
                      print(searchRes);
                      // searchController.text = value;
                      // searchByName(value, prov, context);
                      prov.searchByName(value);
                    },
                    onEditingComplete: () {
                      searchController.text.isEmpty;
                    },
                    style: ThemeText.headingLocation,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        floatingLabelStyle: ThemeText.headingSearchBlack,
                        border: InputBorder.none,
                        hintStyle: ThemeText.headingSearchBig,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 18,
                        ),
                        hintText: 'Search gym or virtual training'),
                  ),
                ),
              ),
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: ColorsTheme.bgScreen),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Search result',
                    style: ThemeText.heading2.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (searchController.text.isNotEmpty)
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 400,
                        child: Consumer<BookingProvider>(
                          builder: (context, value, child) {
                            return ListView.builder(
                              itemCount: value.searchResults.length,
                              itemBuilder: (context, index) {
                                var data = value.searchResults[index];
                                return GestureDetector(
                                  onTap: () {
                                    print("hallo");
                                    print(searchController.text);
                                    print(
                                        'ini yaitu ${value.searchResults.length}');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ExploreScreen(
                                            statusPencarian:
                                                searchController.text),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    minLeadingWidth: 2,
                                    leading: Icon(Icons.search),
                                    title: Text(data.name),
                                    subtitle: Text(data.classType),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    )
                  else if (searchController.text.isEmpty)
                    SingleChildScrollView(
                      child: Text(""),
                    )
                  else
                    Text("no data search"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
