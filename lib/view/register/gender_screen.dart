import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseGenderScreen extends StatefulWidget {
  const ChooseGenderScreen({Key? key}) : super(key: key);
  @override
  State<ChooseGenderScreen> createState() => _ChooseGenderScreenState();
}

class _ChooseGenderScreenState extends State<ChooseGenderScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        backgroundColor: ColorsTheme.bgScreen,
        title: Text(
          'Step 1 of 6',
          style: GoogleFonts.josefinSans(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
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
                child: Text(
                  'Choose Gender',
                  style: GoogleFonts.josefinSans(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 16, top: 22, bottom: 22, right: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.male_outlined,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text('Male',
                          style: GoogleFonts.josefinSans(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 16, top: 22, bottom: 22, right: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.female_outlined,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text('Female',
                          style: GoogleFonts.josefinSans(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700))
                    ],
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
                    backgroundColor: isSelected
                        ? const Color(0xffFF7F00)
                        : const Color(0xffDFDFDF),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        color: isSelected
                            ? const Color(0xFFFF700F)
                            : const Color(0xFFB5B5B5),
                      ),
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
