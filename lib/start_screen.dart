import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class StartScreen extends StatelessWidget {
  const StartScreen(this.swStart(), {super.key});
  final Function() swStart;
  // void Function(String) selectOption;
  @override
  Widget build(context) {
    var Logo_StartButton = [
        Opacity(
          opacity: 1,
          child: Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        const SizedBox(height: 80),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter Revision Quiz",
              style: GoogleFonts.lato(fontSize: 35, color: Colors.white,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  elevation: 900,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
              label: Text(
                "Start Quiz",
                style: GoogleFonts.lato(fontSize: 30, color: Colors.white),
              ),
              icon: const Icon(
                Icons.arrow_circle_right_outlined,
                size: 35,
                color: Colors.lime,
              ),
              // onPressed: () {
              //   swStart();
              // },
              onPressed: swStart,
            ),
          ],
        ),
      ];
    double width=MediaQuery.of(context).size.width;
    // double height=MediaQuery.of(context).size.height;
    if(width<636)
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: Logo_StartButton,
    );
    else 
      return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: Logo_StartButton,
    );
  }
}
