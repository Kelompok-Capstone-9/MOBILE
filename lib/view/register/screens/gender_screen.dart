import 'package:flutter/material.dart';
import 'package:gofit_apps/model/register.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view_model/register_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'height_screen.dart';

// ignore: must_be_immutable
class ChooseGenderScreen extends StatefulWidget {
  const ChooseGenderScreen({
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
                      isGender = 'pria';
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
                            isGender == 'pria'
                                ? Icons.male_outlined
                                : Icons.male_outlined,
                            color: isGender == 'pria'
                                ? ColorsTheme.activeButton
                                : Colors.black),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          isGender == 'pria' ? 'Male' : 'Male',
                          style: isGender == 'pria'
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
                        side: isGender == 'wanita'
                            ? BorderSide(color: ColorsTheme.activeButton)
                            : BorderSide(color: ColorsTheme.inActiveButton),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isGender = 'wanita';
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
                            isGender == 'wanita'
                                ? Icons.female_outlined
                                : Icons.female_outlined,
                            color: isGender == 'wanita'
                                ? ColorsTheme.activeButton
                                : Colors.black),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          isGender == 'wanita' ? 'Female' : 'Female',
                          style: isGender == 'wanita'
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
                    final prov =
                        Provider.of<RegisterProvider>(context, listen: false)
                            .getGenderUser(isGender: Data(gender: isGender));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HeightScreen()));
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
