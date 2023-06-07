import 'package:flutter/material.dart';
import 'package:gofit_apps/model/register.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view_model/register_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'height_screen.dart';

// ignore: must_be_immutable
class ChooseGenderScreen extends StatefulWidget {
  ChooseGenderScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<ChooseGenderScreen> createState() => _ChooseGenderScreenState();
}

String isGender = '';

class _ChooseGenderScreenState extends State<ChooseGenderScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RegisterProvider>(context, listen: false);
    print(prov.name);
    print(prov.email);
    print(prov.password);

    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        backgroundColor: ColorsTheme.bgScreen,
        title: Text(
          'Step 1 of 6',
          style: ThemeText.heading1,
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(left: 20, right: 20)),
              const SizedBox(
                height: 36,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36, bottom: 36),
                child: Text('Choose Gender', style: ThemeText.headingLogin),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: isGender == 'male'
                            ? BorderSide(color: ColorsTheme.activeButton)
                            : BorderSide(color: ColorsTheme.inActiveButton),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isGender = 'male';
                      isSelected = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 16, top: 22, bottom: 22, right: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                            isGender == 'male'
                                ? Icons.male_outlined
                                : Icons.male_outlined,
                            color: isGender == 'male'
                                ? ColorsTheme.activeButton
                                : Colors.black),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          isGender == 'male' ? 'Male' : 'Male',
                          style: isGender == 'male'
                              ? GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: ColorsTheme.activeButton)
                              : GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: const Color(0xff0B0B0B)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: isGender == 'female'
                            ? BorderSide(color: ColorsTheme.activeButton)
                            : BorderSide(color: ColorsTheme.inActiveButton),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isGender = 'female';
                      isSelected = true;
                    });
                  },
                  // style: OutlinedButton.styleFrom(
                  //     foregroundColor: const Color((0xffFF7F00)),
                  //     disabledForegroundColor: ColorsTheme.bgScreen),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 16, top: 22, bottom: 22, right: 16),
                    child: Row(
                      children: [
                        Icon(
                            isGender == 'female'
                                ? Icons.female_outlined
                                : Icons.female_outlined,
                            color: isGender == 'female'
                                ? ColorsTheme.activeButton
                                : Colors.black),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          isGender == 'female' ? 'Female' : 'Female',
                          style: isGender == 'female'
                              ? GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: ColorsTheme.activeButton)
                              : GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: const Color(0xff0B0B0B)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: isSelected == true
                        ? ColorsTheme.activeButton
                        : ColorsTheme.inActiveButton,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HeightScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          color: isSelected == true
                              ? ColorsTheme.activeText
                              : const Color(0xffB5B5B5)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
