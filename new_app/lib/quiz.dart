import "package:flutter/material.dart";
import 'package:new_app/data/questions.dart';
import 'package:new_app/start_screen.dart';
import 'package:new_app/models/question_screen.dart';
import 'package:new_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen;

  // @override
  // //this initState() method called after the object is created!
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  List<String> selectedAnswer = [];
  var activeScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question_screen';
      // activeScreen = const QuestionScreen();
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result_screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'question_screen';
      selectedAnswer = [];
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question_screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result_screen') {
      screenWidget = ResultsScreen(
        chosenAnswer: selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 80, 2, 108),
                Colors.deepPurple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
