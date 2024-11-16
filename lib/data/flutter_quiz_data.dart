import 'package:quiz_app_revision/model/question_model.dart';

var flutterQuizQuestions = [
  QuestionModel(
    "What is the main programming language used for Flutter development?", 
    ["Dart", "Java", "Kotlin", "JavaScript"]  // Correct answer is Dart
  ),
  QuestionModel(
    "Which widget is used to create a basic app layout in Flutter?", 
    ["Scaffold", "MaterialApp", "Container", "Column"]  // Correct answer is Scaffold
  ),
  QuestionModel(
    "How do you declare a stateless widget in Flutter?", 
    [
      "class MyWidget extends StatelessWidget {}",  // Correct answer
      "StatelessWidget MyWidget() {}",
      "MyWidget() => StatelessWidget {}",
      "void MyWidget extends StatelessWidget {}"
    ]
  ),
  QuestionModel(
    "Which method is called to rebuild the UI in a StatefulWidget?", 
    ["setState()", "update()", "refresh()", "build()"]  // Correct answer is setState()
  ),
  QuestionModel(
    "What is the purpose of the 'Container' widget in Flutter?", 
    ["To hold other widgets", "To create a fixed-size box", "To manage state", "To navigate between screens"]  // Correct answer is To hold other widgets
  ),
  QuestionModel(
    "Which widget is used to display an image in Flutter?", 
    ["Image", "Picture", "AssetImage", "Icon"]  // Correct answer is Image
  ),
  QuestionModel(
    "What is the default padding in the 'Padding' widget?", 
    ["Zero", "8 pixels", "16 pixels", "12 pixels"]  // Correct answer is Zero
  ),
  QuestionModel(
    "Which widget is used for vertical scrolling in Flutter?", 
    ["ListView", "Column", "Row", "Stack"]  // Correct answer is ListView
  ),
  QuestionModel(
    "How do you define a theme in a Flutter application?", 
    ["Using ThemeData", "Using MaterialTheme", "Using ThemeWidget", "Using StyleSheet"]  // Correct answer is Using ThemeData
  ),
  QuestionModel(
    "What is the purpose of the 'Future' class in Dart?", 
    ["To handle asynchronous operations", "To create UI elements", "To manage state", "To define routes"]  // Correct answer is To handle asynchronous operations
  ),
];
