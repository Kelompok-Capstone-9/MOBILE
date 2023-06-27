// ini disii ya mas lutfi, udah ada halamannya (article content)
import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/themes/button_subscribe_popup.dart';

class NewsLetter extends StatefulWidget {
  const NewsLetter({super.key});

  @override
  State<NewsLetter> createState() => _NewsLetterState();
}

class _NewsLetterState extends State<NewsLetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Image Popup example')),
        backgroundColor: Colors.grey[800],
        body: Center(
          child: CircleAvatar(
              radius: 50.0,
              backgroundImage: const AssetImage('assets/images/mobile.jpeg'),
              child: GestureDetector(
                onTap: () async {
                  await showDialog(
                      context: context, builder: (_) => ImageDialog());
                },
              )),
        ));
  }
}

class ImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Expanded(
      child: Container(
        width: 370,
        height: 350,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/Popup_newletters.png'),
                fit: BoxFit.cover),
            color: Colors.grey),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          'Subscribe ',
                          style: ThemeText.headingNewsLetterPopup,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          'Newsletters ',
                          style: ThemeText.headingNewsLetterPopup,
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          'Subscribe to our newsletter to',
                          style: ThemeText.headingCoustomPopUp,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          'keep informed about the lastest',
                          style: ThemeText.headingCoustomPopUp,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          'news',
                          style: ThemeText.headingCoustomPopUp,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 50)),
            ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: Text(
                'Subscribe',
                style: ThemeText.headingbuttonPopUp,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
