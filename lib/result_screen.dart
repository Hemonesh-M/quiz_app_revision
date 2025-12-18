import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_revision/data/flutter_quiz_data.dart';
import 'package:quiz_app_revision/summary_result.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.swResult, this.selectedOption, {super.key});
  final Function() swResult;
  final List<String> selectedOption;
  List<Map<String, Object>> getoptionsSummary() {
    final List<Map<String, Object>> optionSummary = [];
    for (int i = 0; i < selectedOption.length; i++) {
      optionSummary.add(
        {
          "qidx": i,
          "q": flutterQuizQuestions[i].question,
          "selectedOption": selectedOption[i],
          "correctOption": flutterQuizQuestions[i].options[0]
        },
      );
    }
    return optionSummary;
  }

  @override
  Widget build(context) {
    // double width = MediaQuery.of(context).size.width;
    List<Map<String, Object>> optionSummary = getoptionsSummary();
    final numberOfQuestions = flutterQuizQuestions.length;
    final correctAnswer = optionSummary.where((data) {
      return data["selectedOption"] == data["correctOption"];
    }).length;
    // var correctAnswer=0;
    // for(int i=0;i<numberOfQuestions;i++){
    //   if(optionSummary[i]['selectedOption']==optionSummary[i]['correctOption']){
    //     correctAnswer++;
    //   }
    // }
    var resultText = Text(
      "ResultScreen",
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    );
    var qCorrectText = Text(
      "You Answered $correctAnswer Questions Correctly Out Of $numberOfQuestions Questions",
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
          fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
    );
    var container = Container(
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 112, 39, 176),
        ),
        onPressed: swResult,
        label: Text(
          "Resart Quiz",
          style: GoogleFonts.lato(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        icon: Icon(
          Icons.restart_alt_outlined,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
    return Scaffold(
    backgroundColor: Colors.transparent, // Keeps your gradient from quiz.dart
    body: Container(
      margin: const EdgeInsets.only(left: 5, top: 40),
      child: Container(
        padding: EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              resultText,
              qCorrectText,
              SizedBox(height: 20),
              // ACTUAL SUMMARY
              SummaryResult(optionSummary),
              SizedBox(height: 20),
              container
            ],
          ),
        ),
      ),
      ),
    );
  }
}
