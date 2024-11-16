// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:quiz_app_revision/result_screen.dart';
class SummaryResult extends StatelessWidget {
  const SummaryResult(this.optionSummary, {super.key});
  final List<Map<String, Object>> optionSummary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
            children: optionSummary.map(
          (data) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(217, 26, 4, 104),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(

                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(1),
                      backgroundColor:
                          data["selectedOption"] == data["correctOption"]
                              ? Colors.green
                              : Colors.red,
                    ),
                    child: Text(
                      ((data['qidx'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['q'] as String,
                            style: GoogleFonts.lato(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        if (data["selectedOption"] != data["correctOption"])
                          Text(
                            "Option Selected:  ${data['selectedOption'] as String}",
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        Text(
                            "Correct Option:  ${data['correctOption'] as String}",
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ).toList()),
      ),
    );
  }
}
