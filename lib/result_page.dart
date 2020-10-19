import 'package:bmi_calculator/RouteArgument.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultAct extends StatelessWidget {
  static const routeName = '/result';

  @override
  Widget build(BuildContext context) {
    final RouteArgument args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultats BMI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Votre BMI est :',
              style: textStyles,
            ),
            Text(
              args.argument,
              style: textStylesTitle,
            )
          ],
        ),
      ),
    );
  }
}
