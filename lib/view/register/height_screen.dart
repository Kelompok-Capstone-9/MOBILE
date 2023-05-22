import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({Key? key}) : super(key: key);
  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        backgroundColor: ColorsTheme.bgScreen,
        title: Text('Step 2 of 6', style: ThemeText.heading1),
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
            Center(
              child: Text('Input Your Height',
                  style: GoogleFonts.josefinSans(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700)),
            ),
            const SizedBox(
              height: 36,
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              width: 80,
              height: 60,
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Color(0xFFFFFFFF),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF606060),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
            const SizedBox(
              height: 68,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color(0xffFF7F00)),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text('Continue',
                      style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
