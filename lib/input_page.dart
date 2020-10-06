import 'package:bmi_calculator/card_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String gender;
  double height = 120;

  void changeGender(String val) {
    setState(() {
      if (val == 'male') {
        gender = 'male';
      } else {
        gender = 'female';
      }
    });
  }

  void changeHeight(double val) {
    setState(() {
      this.height = val;
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 72.0),
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
                              value: this.height,
                              min: 100,
                              max: 240,
                              onChanged: (double val) {
                                changeHeight(val);
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
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      color: containerBackgroundColorDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
