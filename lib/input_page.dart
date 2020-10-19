import 'package:bmi_calculator/RouteArgument.dart';
import 'package:bmi_calculator/card_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_card.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/round_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  static const routeName = '/';

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final int DEFAUT_HEIGHT = 120;
  final int DEFAULT_WEIGHT = 60;
  final int DEFAULT_AGE = 20;

  String gender;
  int height;
  int weight;
  int age;
  String bmiResult;

  CalculatorBrain bmi;

  _InputPageState() {
    this.height = this.DEFAUT_HEIGHT;
    this.weight = this.DEFAULT_WEIGHT;
    this.age = this.DEFAULT_AGE;
  }

  void changeAge(int val) {
    setState(() {
      this.age += val;
    });
  }

  void changeGender(String val) {
    setState(() {
      if (val == 'male') {
        gender = 'male';
      } else {
        gender = 'female';
      }
    });
  }

  void changeHeight(int val) {
    setState(() {
      this.height = val;
    });
  }

  void changeWeight(int val) {
    setState(() {
      this.weight += val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      onPress: () {
                        changeGender('male');
                      },
                      child: CardContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'HOMME',
                      ),
                      color: gender == 'male'
                          ? containerBackgroundColorLight
                          : containerBackgroundColorDark,
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      onPress: () {
                        changeGender('female');
                      },
                      child: CardContent(
                        text: 'FEMME',
                        icon: FontAwesomeIcons.venus,
                      ),
                      color: gender == 'female'
                          ? containerBackgroundColorLight
                          : containerBackgroundColorDark,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      color: containerBackgroundColorDark,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'TAILLE',
                            style: textStyles,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  this.height.toInt().toString(),
                                  style: textStylesTitle,
                                ),
                                Text(
                                  'cm',
                                  style: textStyles,
                                ),
                              ],
                            ),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: secondaryColor,
                              inactiveTrackColor: containerBackgroundColorLight,
                              activeTrackColor: Colors.grey.shade300,
                              trackHeight: 1,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                              overlayColor: secondaryColor.withAlpha(33),
                            ),
                            child: Slider(
                              value: this.height.floorToDouble(),
                              min: 100,
                              max: 240,
                              onChanged: (double val) {
                                changeHeight(int.parse(val.floor().toString()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      color: containerBackgroundColorDark,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'POIDS',
                            style: textStyles,
                          ),
                          Text(
                            weight.toString(),
                            style: textStylesTitle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                enabled: this.weight != 240,
                                onPressed: this.weight != 240
                                    ? () => changeWeight(1)
                                    : null,
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              RoundButton(
                                enabled: this.weight != 20,
                                onPressed: this.weight == 20
                                    ? null
                                    : () => this.changeWeight(-1),
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      color: containerBackgroundColorDark,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: textStyles,
                          ),
                          Text(
                            age.toString(),
                            style: textStylesTitle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                enabled: this.age != 110,
                                onPressed:
                                    this.age != 110 ? () => changeAge(1) : null,
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              RoundButton(
                                enabled: this.age != 5,
                                onPressed: this.age == 5
                                    ? null
                                    : () => this.changeAge(-1),
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                bmi = new CalculatorBrain(
                  height: this.height,
                  weight: this.weight,
                );
                bmiResult = bmi.calculateBMI();

                Navigator.pushNamed(
                  context,
                  ResultAct.routeName,
                  arguments: RouteArgument(
                    argument: bmiResult,
                  ),
                );
              },
              constraints: BoxConstraints(
                minHeight: 80.0,
                minWidth: double.infinity,
              ),
              fillColor: secondaryColor,
              child: Text(
                'Calculer',
                style: textStylesTitleH2,
              ),
            ),
          ],
        ));
  }
}
