import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_revision/start_screen.dart';
import 'package:quiz_app_revision/question_screen.dart';
import 'package:quiz_app_revision/result_screen.dart';

// ignore: must_be_immutable
class Quiz extends StatefulWidget {
  const Quiz({super.key});
  // const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedOption = [];

  void selectOption(String option) {
    selectedOption.add(option);
  }

  Widget? screen;
  @override
  void initState() {
    super.initState();
    screen = StartScreen(swStart);
  }

  void swStart() {
    setState(() {
      screen = QuestionScreen(swQuestions, selectOption);
    });
  }

  // screen=StartScreen(swStart);
  void swQuestions() {
    setState(() {
      screen = ResultScreen(swResult, selectedOption);
    });

    // Transition to ResultScreen only if user confirmed
  }

  void swResult() {
    setState(() {
      screen = StartScreen(swStart);
      selectedOption.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // 1. Unified Gradient AppBar
        appBar: AppBar(
          title: Text(
            "Quiz Pro",
            // style: TextStyle(
            //   color: Colors.white
            // ),
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 4, // Adds a slight shadow for depth
          // shadowColor: Colors.black.withValues(colorSpace: Colors.),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 63, 11, 147), // Slightly brighter for top
                  Colors.deepPurple,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.help_outline, color: Colors.white70),
          //     onPressed: () {}, // Optional: Add a help icon
          //   ),
          // ],
        ),

        // 2. Main Body with matching background
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Color.fromARGB(255, 9, 2, 75)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(child: screen),
        ),
      ),
    );
  }
}
