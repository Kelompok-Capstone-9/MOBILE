import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofit_apps/model/public_api.dart';
import 'package:gofit_apps/view_model/artikel_provider.dart';
import 'package:provider/provider.dart';
import '../../themes/color_style.dart';
import '../../component/register/decoration_form.dart';
import 'healty_tips_screen.dart';

class Artikel extends StatefulWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  State<Artikel> createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ArtikelProvider>(context, listen: false).fetchArtikel();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ArtikelProvider>(context);

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'ARTICLES',
          style: ThemeText.heading1,
        ),
        elevation: 0.2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              decoration: DecorationFormStyle.decorationForm(
                labelText: 'Cari Articles',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFFB5B5B5),
                  size: 16,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  prov.search(searchController.text);
                });
              },
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Display all', style: ThemeText.labelDay),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemCount: prov.filteredArtikel.length,
                itemBuilder: (context, index) {
                  final newsletter = prov.filteredArtikel[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: GestureDetector(
                      onTap: () {
                        log('kehalaman detail');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HealthTips(
                              content: newsletter.content,
                              urlToImage: newsletter.urlToImage.toString(),
                              title: newsletter.title.toString(),
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HealthTips(
                                        title: newsletter.title.toString(),
                                        content: newsletter.content.toString(),
                                        urlToImage:
                                            newsletter.urlToImage.toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: width / 2 - (5 / 100 * width),
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: newsletter.urlToImage != null ?
                                      Image.network(
                                        newsletter.urlToImage.toString(),
                                        fit: BoxFit.cover,
                                      ).image : const AssetImage('assets/images/mobile.jpeg'),
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        color: Colors.orange,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            newsletter.source.name.toString(),
                                            style:
                                                ThemeText.headingCustomTittle,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                newsletter.title.toString(),
                                style: ThemeText.heading4,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
