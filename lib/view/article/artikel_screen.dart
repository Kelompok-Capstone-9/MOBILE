import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofit_apps/view_model/newsLetter_provider.dart';
import 'package:provider/provider.dart';
import '../../model/news_letter.dart';
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
  List<NewsLetter> filteredArtikel = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsLetterProvider>(context, listen: false).fetchNewsLetter();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsLetterProvider>(context);
    filteredArtikel = searchController.text.isEmpty
        ? newsProv.artikel
        : newsProv.artikel
            .where((artikel) =>
                artikel.category!
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()) ||
                artikel.judulArtikel!
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()))
            .toList();

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
                setState(() {});
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
                itemCount: filteredArtikel.length,
                itemBuilder: (context, index) {
                  final newsletter = filteredArtikel[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: GestureDetector(
                      onTap: () {
                        log('kehalaman detail');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HealtyTips(
                              desc: newsletter.descArtikel.toString(),
                              imgurl: newsletter.imageUrl.toString(),
                              judulDesc: newsletter.judulArtikel.toString(),
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width / 2 - (5 / 100 * width),
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  newsletter.imageUrl.toString(),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.orange,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      newsletter.category.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                newsletter.judulArtikel.toString(),
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
