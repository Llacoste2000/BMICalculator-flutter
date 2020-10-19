import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;

  String calculateBMI() {
    double result = this.weight / pow(height / 100, 2);
    print(result);
    return result.toStringAsFixed(1);
  }
}
