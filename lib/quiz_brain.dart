import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quizzler/Question.dart';

class QuizBrain {
  int _current = 0;
  int _score = 0;
  List<Icon> _scoreKeeper = [];
  List<Question> _qList = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  int getCurrent() {
    return _current;
  }

  void nextQuestion(BuildContext context) {
    if (_current >= _qList.length - 1) {
      _current = 0;
      Alert(
              context: context,
              title: "That's all folks!",
              desc: "Your score: " + getScore().toString())
          .show();
      _scoreKeeper.clear();
      _score = 0;
    } else
      _current++;
  }

  int getLength() {
    return _qList.length;
  }

  bool getAnswer() {
    return _qList[_current].answer;
  }

  String getQuestion() {
    return _qList[_current].qText;
  }

  List<Icon> getScoreKeeper() {
    return _scoreKeeper;
  }

  int getScore() {
    return _score;
  }

  void newCorrectScore() {
    _scoreKeeper.add(Icon(
      Icons.check,
      color: Colors.green,
    ));
    _score++;
  }

  void newIncorrectScore() {
    _scoreKeeper.add(Icon(
      Icons.close,
      color: Colors.red,
    ));
  }
}
