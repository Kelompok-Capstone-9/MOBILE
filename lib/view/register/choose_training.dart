import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/widget/card_training.dart';
import 'package:hovering/hovering.dart';

import 'join_member_screen.dart';

class ChooseTrainingScreen extends StatefulWidget {
  const ChooseTrainingScreen({Key? key}) : super(key: key);
  @override
  State<ChooseTrainingScreen> createState() => _ChooseTrainingScreenState();
}

class _ChooseTrainingScreenState extends State<ChooseTrainingScreen> {
  @override
  Widget build(BuildContext context) {
    var isSelected = false;
    String _trainingLevel = "";
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        backgroundColor: ColorsTheme.bgScreen,
        title: Text('Step 5 of 6', style: ThemeText.heading1),
        centerTitle: true,
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
            height: 212,
            child: ListView.builder(
                itemCount: trainingLevel.length,
                itemBuilder: (context, index) {
                  var i = trainingLevel[index];
                  return GestureDetector(
                    onTap: () => setState(() {
                      _trainingLevel = i['name'].toString();
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: i['onTap'] == true
                                  ? ColorsTheme.activeButton
                                  : const Color(0xff919191).withOpacity(0.6)),
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 0.2,
                      color: ColorsTheme.bgScreen,
                      margin:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: CardTraining(
                          name: i['name'].toString(),
                          desc: i['desc'].toString()),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: HoverButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onpressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const JoinMemberScreen()));
              },
              color: ColorsTheme.activeButton,
              hoverColor: const Color(0xffFF7F00),
              hoverTextColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Continue',
                  style: ThemeText.heading1,
                ),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
