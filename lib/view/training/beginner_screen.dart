import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/model/training.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/training/widgets/training_card.dart';

class BeginnerScreen extends StatefulWidget {
  const BeginnerScreen({Key? key}) : super(key: key);

  @override
  State<BeginnerScreen> createState() => _BeginnerScreenState();
}

class _BeginnerScreenState extends State<BeginnerScreen> {
  get index => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsTheme.bgScreen,
        appBar: AppBar(
            elevation: 0.8,
            title: Text('Beginner', style: ThemeText.heading1),
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.black)),
            backgroundColor: ColorsTheme.bgScreen),
        body: SingleChildScrollView(
            child: SafeArea(
                child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 18, right: 18),
            child: SizedBox(
              height: 550,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24),
                  itemCount: trainingBeginner.length,
                  itemBuilder: (context, index) {
                    var i = trainingBeginner[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: ColorsTheme.bgScreen,
                        elevation: 0.6,
                        child: CardTraining(
                            image: i['image'].toString(),
                            title: i['title'].toString()),
                      ),
                    );
                  }),
            ),
          ),
        ))));
  }
}
