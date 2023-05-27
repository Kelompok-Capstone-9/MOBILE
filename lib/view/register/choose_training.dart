import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/widget/card_training.dart';

class ChooseTrainingScreen extends StatefulWidget {
  const ChooseTrainingScreen({Key? key}) : super(key: key);
  @override
  State<ChooseTrainingScreen> createState() => _ChooseTrainingScreenState();
}

class _ChooseTrainingScreenState extends State<ChooseTrainingScreen> {
  @override
  Widget build(BuildContext context) {
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
          const Padding(padding: EdgeInsets.only(left: 20, right: 20)),
          const SizedBox(
            height: 36,
          ),
          Center(
            child: Text('Choose Training Level', style: ThemeText.headingLogin),
          ),
          const SizedBox(
            height: 36,
          ),
          OutlinedButton(
              onPressed: () {
                setState(() {});
              },
              style: OutlinedButton.styleFrom(
                  foregroundColor: const Color((0xffFF7F00)),
                  disabledForegroundColor: ColorsTheme.bgScreen),
              child: ListView.builder(itemBuilder: ((context, index) {
                var i = trainingLevel[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: i['onTap'] == true
                              ? const Color(0xffFF7F00)
                              : const Color(0xffDFDFDF))),
                  elevation: 0.2,
                  color: ColorsTheme.bgScreen,
                  margin: const EdgeInsets.only(right: 20, top: 16),
                  child: CardTraining(
                      name: i['name'].toString(), desc: i['desc'].toString()),
                );
              })))
        ]),
      )),
    );
  }
}
