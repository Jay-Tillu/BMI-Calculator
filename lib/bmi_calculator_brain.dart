import 'dart:math';
import 'package:flutter/cupertino.dart';

class BmiCalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  BmiCalculatorBrain({@required this.height, @required this.weight});

  String calculateBMI() {
//  Method for calculate BMI.
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getTextResults() {
//   Method for showing the result in text.
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
//   Method for showing the interpretation according to result.
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}
