// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/model/register.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/screens/gender_screen.dart';
import 'package:gofit_apps/view_model/register_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'weight_screen.dart';

// ignore: must_be_immutable
class HeightScreen extends StatefulWidget {
  const HeightScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  // kondisi ketika chips nya berganti antara cm/ft
  double feet = 30.48; //cm  //1 cm adalah segitu
  int nilaiInputAwal = 0;
  List<bool> isSelected = [true, false];
  var label = [ItemChoice(1, 'Centimetre'), ItemChoice(2, 'Feet')];
  var idSelected = 0;
  var _heightController = TextEditingController();
  bool isFormFilled = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final prov = Provider.of<RegisterProvider>(context, listen: false);
    // print(prov.name);
    // print(prov.email);
    // print(prov.password);
    // print(prov.isGender);
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: ColorsTheme.bgScreen,
        title: Text('Step 2 of 6', style: ThemeText.heading1),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Colors.black)),
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
              child: Text('Input Your Height', style: ThemeText.headingLogin),
            ),
            const SizedBox(
              height: 36,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xffE6E6E6)),
              child: ToggleButtons(
                isSelected: isSelected,
                onPressed: (index) {
                  setState(
                    () {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        isSelected[buttonIndex] = (buttonIndex == index);
                      }
                    },
                  );
                  if (isSelected[1]) {
                    var ft = int.parse(_heightController.text) / feet;
                    _heightController.text = ft.toString();
                    log('is feet aktif $ft ');
                  } else {
                    _heightController.text = nilaiInputAwal.toString();
                    log('is cm aktif ${_heightController.text}');
                  }
                },
                borderRadius: BorderRadius.circular(20.0),
                borderColor: Colors.transparent,
                borderWidth: 0,
                selectedBorderColor: Colors.transparent,
                fillColor: Colors.transparent,
                constraints: const BoxConstraints(minWidth: 100),
                children: [
                  TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: isSelected[0]
                          ? Colors.white
                          : const Color(0xffE6E6E6),
                    ),
                    child: Text(
                      'Centimetre',
                      style: GoogleFonts.josefinSans(
                          color: isSelected[0]
                              ? const Color(0xff030303)
                              : const Color(0xff606060),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: isSelected[1]
                          ? Colors.white
                          : const Color(0xffE6E6E6),
                    ),
                    child: Text(
                      'feet',
                      style: GoogleFonts.josefinSans(
                          color: isSelected[1]
                              ? const Color(0xff030303)
                              : const Color(0xff606060),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 56,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: formKey,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    width: 80,
                    height: 60,
                    child: TextFormField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        counterText: "",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF606060),
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        fillColor: Color(0xFFFFFFFF),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      maxLength: 3,
                      onChanged: (value) {
                        setState(() {
                          isFormFilled = _heightController.text.isNotEmpty;
                          // simpan data ke nilaiawal sebelum dikonversi (untuk ke saave ke db)
                          nilaiInputAwal = int.parse(_heightController.text);
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  isSelected[0] ? 'cm' : "feet",
                  style: ThemeText.heading1,
                ),
              ],
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
                  backgroundColor: isFormFilled
                      ? const Color(0xffFF7F00)
                      : const Color(0xffDFDFDF),
                ),
                onPressed: () {
                  final isValidForm = formKey.currentState!.validate();
                  if (isValidForm) {
                    final prov = Provider.of<RegisterProvider>(context,
                            listen: false)
                        .getHeightUser(height: Data(height: nilaiInputAwal));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WeightScreen()),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      color: isFormFilled
                          ? const Color(0xFFF6F6F6)
                          : const Color(0xFFB5B5B5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ItemChoice {
  final int id;
  final String label;

  ItemChoice(this.id, this.label);
}
