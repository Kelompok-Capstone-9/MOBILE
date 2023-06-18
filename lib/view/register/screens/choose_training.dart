import 'package:flutter/material.dart';
import 'package:gofit_apps/model/level_training.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/model/register.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/component/register/card_training.dart';
import 'package:gofit_apps/view_model/level_provider.dart';
import 'package:gofit_apps/view_model/register_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_model/login_provider.dart';
import 'join_member_screen.dart';

class ChooseTrainingScreen extends StatefulWidget {
  const ChooseTrainingScreen({Key? key}) : super(key: key);
  @override
  State<ChooseTrainingScreen> createState() => _ChooseTrainingScreenState();
}

class _ChooseTrainingScreenState extends State<ChooseTrainingScreen> {
  String _trainingLevel = "";
  String selectedNameLevel = '';
  @override
  void initState() {
    super.initState();
    final prov =
        Provider.of<LevelProvider>(context, listen: false).fetchLevelUser();
  }

  @override
  Widget build(BuildContext context) {
    final levelProvider = Provider.of<LevelProvider>(context);
    final levelModel = levelProvider.level;
    final registerProv = Provider.of<RegisterProvider>(context);

    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        elevation: 0.2,
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
            child: Consumer<LevelProvider>(
                builder: (context, levelProvider, child) => ListView.builder(
                    itemCount: levelProvider.level.length,
                    itemBuilder: (context, index) {
                      final levTraining = levelProvider.level[index];
                      final nameLevel = levTraining?.nameLevel;

                      bool isSelected =
                          selectedNameLevel == levTraining?.nameLevel;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedNameLevel = nameLevel!;
                          });

                          print('Selected Name Level: $selectedNameLevel');
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              // ignore: unrelated_type_equality_checks
                              color: isSelected
                                  ? ColorsTheme.primary600
                                  : const Color(0xff919191).withOpacity(0.6),
                            ),
                          ),
                          elevation: 0.2,
                          color: ColorsTheme.bgScreen,
                          margin: const EdgeInsets.only(
                            left: 16,
                            right: 20,
                            top: 16,
                          ),
                          child: CardTraining(
                              nameLevel: levTraining!.nameLevel.toString(),
                              desc: levTraining.description.toString()),
                        ),
                      );
                    })),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              final prov = Provider.of<RegisterProvider>(context, listen: false)
                  .getLevelUser(level: Data(trainingLevel: selectedNameLevel));

              final register = Provider.of<RegisterProvider>(context,
                      listen: false)
                  .register(
                      Data(
                          name: registerProv.name!.name,
                          email: registerProv.email!.email,
                          password: registerProv.password!.password,
                          gender: registerProv.genderUser!.gender,
                          height: registerProv.heightUser!.height,
                          weight: registerProv.weightUser!.weight,
                          goalWeight: registerProv.weightGoalUser!.goalWeight,
                          trainingLevel: registerProv.level!.trainingLevel),
                      context);

              // if (registerProv.statusCode == 200) {
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
                  color: selectedNameLevel != ""
                      ? ColorsTheme.activeButton
                      : ColorsTheme.inActiveButton,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Continue",
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: selectedNameLevel != ""
                          ? ColorsTheme.activeText
                          : const Color(0xffB5B5B5)),
                )),
          ),
        ]),
      )),
    );
  }
}
