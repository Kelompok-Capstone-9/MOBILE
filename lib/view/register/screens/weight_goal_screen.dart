// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gofit_apps/model/register.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/screens/choose_training.dart';
import 'package:gofit_apps/view_model/register_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WeightGoalScreen extends StatefulWidget {
  var name;

  var email;

  var password;

  var gender;

  var height;

  var weight;

  WeightGoalScreen(
      {Key? key,
      required name,
      required email,
      required password,
      required gender,
      required height,
      required this.weight})
      : super(key: key);
  @override
  State<WeightGoalScreen> createState() => _WeightGoalScreenState();
}

class _WeightGoalScreenState extends State<WeightGoalScreen> {
  List<bool> isSelected = [true, false];
  final _weightGoalController = TextEditingController();
  bool isFormFilled = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: ColorsTheme.bgScreen,
        title: Text('Step 4 of 6', style: ThemeText.heading1),
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
              child: Text('Input Goal Weight', style: ThemeText.headingLogin),
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
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      isSelected[buttonIndex] = (buttonIndex == index);
                    }
                  });
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
                      'Kilogram',
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
                      'Pound',
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
                      controller: _weightGoalController,
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
                          isFormFilled = _weightGoalController.text.isNotEmpty;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'kg',
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ChooseTrainingScreen()),
                    // );
                    final registerUser = Data(
                      // isi name dll pakai constructor dari halaman ini

                      name: widget.name,
                      email: widget.email,
                      password: widget.password,
                      gender: widget.gender,
                      height: widget.height,
                      weight: widget.weight,
                      goalWeight: 0,
                      goalHeight: 0,
                    );

                    Provider.of<RegisterProvider>(context, listen: false)
                        .register(registerUser);
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
