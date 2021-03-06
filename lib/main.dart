import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: primaryColor,
          accentColor: secondaryColor,
          scaffoldBackgroundColor: backgroundColor,
          textTheme: TextTheme(
            body1: TextStyle(color: textPrimary),
          )),
      home: InputPage(),
      initialRoute: '/',
      routes: {
        ResultAct.routeName: (context) => ResultAct(),
      },
    );
  }
}
