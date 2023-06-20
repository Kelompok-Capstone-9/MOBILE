import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class HealtyTips extends StatefulWidget {
  final String imgurl;
  final String judulDesc;
  final String desc;
  const HealtyTips({
    super.key,
    required this.imgurl,
    required this.judulDesc,
    required this.desc,
  });

  String getItemTitle() {
    return judulDesc;
  }

  String getItemDesc() {
    return desc;
  }

  String getItemImgUrl() {
    return imgurl;
  }

  @override
  State<HealtyTips> createState() => _HealtyTipsState();
}

class _HealtyTipsState extends State<HealtyTips> {
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
                          widget.getItemImgUrl(),
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
