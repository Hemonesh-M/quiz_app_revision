import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// if we extends from statelessWidget then we will have to make build(context) and
// that is returned by default
// ignore: must_be_immutable
class OptionModel extends StatelessWidget {
  const OptionModel(this.option, this.nextQuestion, {super.key});
  final String option;
  final void Function() nextQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: nextQuestion,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          elevation: 0.9,
      
        ),
        child: Text(option,textAlign:TextAlign.center,style: GoogleFonts.lato(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
