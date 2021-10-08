// import 'dart:html';

import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final questions = const [
    {
      'questionText': 'what is your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'Yellow'],
    },
    {
      'questionText': 'what is your favorite pet?',
      'answers': ['Cat', 'Dog', 'Bird'],
    },
    {
      'questionText': 'what is your favorite food name?',
      'answers': ['Pasta', 'Eggs', 'Meat', 'Vegetables'],
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bar Title - HI THERE!!'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You Did IT!'),
              ),
      ),
    );
  }
}
