import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class StartScreen extends StatelessWidget {
  const StartScreen(this.swStart(), {super.key});
  final Function() swStart;
  // void Function(String) selectOption;
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: 1,
          child: Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        const SizedBox(height: 80),
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
    );
  }
}
