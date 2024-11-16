class QuestionModel {
  QuestionModel(this.question,this.options);
  String question;
  List<String> options;
  List<String> getShuffeledOptions(){
    final dupli=List.of(options);
    dupli.shuffle();
    return dupli;
  }
}