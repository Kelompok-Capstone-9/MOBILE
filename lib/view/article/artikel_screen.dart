import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/view_model/newsLetter_provider.dart';
import 'package:provider/provider.dart';

import '../../themes/color_style.dart';
import '../../component/login/decoration_form.dart';
import '../../component/register/decoration_form.dart';
import 'healty_tips_screen.dart';

class Artikel extends StatefulWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  State<Artikel> createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  TextEditingController username = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<NewsLetterProvider>(context, listen: false)
            .fetchNewsLetter());
  }

  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsLetterProvider>(context);

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              // controller: _emailController,
              decoration: DecorationFormStyle.decorationForm(
                labelText: 'Cari Gym atau kelas online',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFFB5B5B5),
                  size: 16,
                ),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 14,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Display all',
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.75),
                itemCount: newsProv.artikel.length,
                itemBuilder: (context, index) {
                  final newsletter = newsProv.artikel[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    log('kehalaman detail');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HealtyTips(
                                            desc: newsletter.descArtikel
                                                .toString(),
                                            imgurl:
                                                newsletter.imageUrl.toString(),
                                            judulDesc: newsletter.judulArtikel
                                                .toString()),
                                      ),
                                    );
                                  },
                                  child: Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
