import 'package:flutter/material.dart';
import 'package:quiz_app_revision/data/flutter_quiz_data.dart';
import 'package:quiz_app_revision/model/option_model.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class QuestionScreen extends StatefulWidget {
  QuestionScreen(this.swQuestions, this.selectOption, {super.key});
  void Function() swQuestions;
  void Function(String) selectOption;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int idx = 0;
  void nextQuestion(String option) {
    setState(
      () {
        idx++;
        widget.selectOption(option);
        if (idx == flutterQuizQuestions.length) widget.swQuestions();
      },
    );
  }

  @override
  Widget build(context) {
    final curquestion = flutterQuizQuestions[idx];
    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textAlign: TextAlign.center,
            curquestion.question,
            style: GoogleFonts.lato(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          ...curquestion.getShuffeledOptions().map(
            (item) {
              return OptionModel(
                item,
                () {
                  nextQuestion(item);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
