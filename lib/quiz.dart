import 'package:flutter/material.dart';
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
  void swQuestions()  {
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
  Widget build(contex) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Color.fromARGB(255, 9, 2, 75)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(child: screen),
        ),
      ),
    );
  }
}
