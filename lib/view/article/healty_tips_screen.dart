// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
<<<<<<< HEAD
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
=======
>>>>>>> 64fbe64fdb2a86490901df2eae6eb56b76b3c6d4

class HealthTips extends StatefulWidget {
  final String? author;
  final String title;
  final String? urlToImage;
  final String content;

  const HealthTips({
    super.key,
    this.author,
    required this.title,
    this.urlToImage,
    required this.content,
  });

  String getItemTitle() {
    return title;
  }

  String getItemDesc() {
    return content;
  }

  String? getItemImgUrl() {
    return urlToImage;
  }

  @override
  State<HealthTips> createState() => _HealthTipsState();
}

<<<<<<< HEAD
class _HealthTipsState extends State<HealthTips> {
=======
class _HealtyTipsState extends State<HealtyTips> {
>>>>>>> 64fbe64fdb2a86490901df2eae6eb56b76b3c6d4
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 49, 0, 0),
      child: SingleChildScrollView(
        child: SizedBox(
          width: mediaquery.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          widget.getItemImgUrl().toString(),
                        ))),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(widget.getItemTitle(),
                            style: ThemeText.headingHealtyTips,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 8),
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
<<<<<<< HEAD
                          child: ReadMoreText(widget.getItemDesc(),
                              trimLines: 2,
                              textAlign: TextAlign.justify,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: "Show More",
                              trimExpandedText: "Show Less",
                              style: ThemeText.headingCoustomHealtyTips))
=======
                        child: Text(
                          widget.getItemDesc(),
                          textAlign: TextAlign.justify,
                          style: ThemeText.headingCustom.copyWith(
                            height: 1.5,
                          ),
                        ),
                      ),
>>>>>>> 64fbe64fdb2a86490901df2eae6eb56b76b3c6d4
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
