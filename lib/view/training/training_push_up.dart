import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainingPushUp extends StatefulWidget {
  const TrainingPushUp({super.key});

  @override
  State<TrainingPushUp> createState() => _TrainingPushUp();
}

class _TrainingPushUp extends State<TrainingPushUp> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 48, 0, 0),
      child: Column(
        children: [
          Container(
            height: 420,
            width: mediaquery.width,
            color: const Color.fromARGB(255, 252, 210, 158),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                ),
                Text(
                  'REST',
                  style: GoogleFonts.josefinSans(
                      fontSize: 55, fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.all(16)),
                Text(
                  '00:10',
                  style: GoogleFonts.josefinSans(
                      fontSize: 60, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: ColorsTheme
                            .orangelight, //background color of button
                        //border width and color
                        elevation: 5, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.fromLTRB(
                            120, 15, 120, 15) //content padding inside button
                        ),
                    onPressed: () {
                      //code to execute when this button is pressed.
                    },
                    child: const Text("Mulai")),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 13,
                    ),
                    Text('NEXT',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 10,
                    ),
                    Text('4/4',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('STAGGERED ARM PUSH UP 00:20',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Container(
            child: Image.asset('assets/gif/Video (12).gif'),
          )
        ],
      ),
    ));
  }
}
