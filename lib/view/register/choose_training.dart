import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/widget/card_training.dart';
import 'package:google_fonts/google_fonts.dart';

import 'join_member_screen.dart';

class ChooseTrainingScreen extends StatefulWidget {
  const ChooseTrainingScreen({Key? key}) : super(key: key);
  @override
  State<ChooseTrainingScreen> createState() => _ChooseTrainingScreenState();
}

class _ChooseTrainingScreenState extends State<ChooseTrainingScreen> {
  String _trainingLevel = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        backgroundColor: ColorsTheme.bgScreen,
        title: Text('Step 5 of 6', style: ThemeText.heading1),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 36)),
          Center(
            child: Text('Choose Training Level', style: ThemeText.headingLogin),
          ),
          const SizedBox(
            height: 36,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
                itemCount: trainingLevel.length,
                itemBuilder: (context, index) {
                  var i = trainingLevel[index];
                  return GestureDetector(
                    onTap: () => setState(() {
                      _trainingLevel = i['name'].toString();
                      trainingLevel = trainingLevel.map((item) {
                        if (item['name'] == i['name']) {
                          return {
                            ...item,
                            'onTap': true,
                          };
                        } else {
                          return {
                            ...item,
                            'onTap': false,
                          };
                        }
                      }).toList();
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: i['onTap'] == true
                                ? ColorsTheme.activeButton
                                : const Color(0xff919191).withOpacity(0.6),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 0.2,
                      color: ColorsTheme.bgScreen,
                      margin:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: CardTraining(
                        name: i['name'].toString(),
                        desc: i['desc'].toString(),
                        isTapped: bool.parse(i['onTap'].toString()),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              // log('selesai memilih payment method');
              // // kirim data ketika selesai memilih
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const JoinMemberScreen()),
              );
            },
            child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 360,
                padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  color: _trainingLevel != ""
                      ? ColorsTheme.activeButton
                      : ColorsTheme.inActiveButton,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Continue",
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: _trainingLevel != ""
                          ? ColorsTheme.activeText
                          : const Color(0xffB5B5B5)),
                )),
          ),
        ]),
      )),
    );
  }
}
