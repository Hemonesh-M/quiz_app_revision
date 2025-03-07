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
        if (idx == flutterQuizQuestions.length) {
          showDialog(
            context: context,
            builder: (cntx) {
              return Expanded(
                child: AlertDialog(
                  title: Text("Submit Quiz"),
                  content: Text(
                      "Are you sure you want to submit the quiz and view results?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(cntx)
                          .pop(false), // User chooses "Cancel"
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(cntx).pop(true), // User chooses "OKAY"
                      child: Text("OKAY"),
                    ),
                  ],
                ),
              );
            },
          );
          widget.swQuestions();
        }
      },
    );
  }

  @override
  Widget build(context) {
    double width = MediaQuery.of(context).size.width;
    final curquestion = flutterQuizQuestions[idx];
    var qText = Text(
      textAlign: TextAlign.center,
      curquestion.question,
      style: GoogleFonts.lato(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    );
    var optionsButton = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      // textBaseline: TextBaseline.values[0],
      children: [
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
    );
    // var children = [qText,const SizedBox(height: 20,),optionsButton];
    if (width < 636)
      return Container(
          margin: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              qText,
              const SizedBox(
                height: 20,
              ),
              optionsButton
            ],
          ));
    else
      return Container(
        margin: const EdgeInsets.all(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [Expanded(child: qText), Expanded(child: optionsButton)],
        ),
      );
  }
}
