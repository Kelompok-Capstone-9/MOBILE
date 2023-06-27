// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

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

class _HealthTipsState extends State<HealthTips> {
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
                        child: Text(
                          widget.getItemDesc(),
                          textAlign: TextAlign.justify,
                          style: ThemeText.headingCustom.copyWith(
                            height: 1.5,
                          ),
                        ),
                      ),
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
