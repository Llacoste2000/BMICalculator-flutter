import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({this.icon, this.onPressed, this.enabled});

  final Widget icon;
  final Function onPressed;
  final enabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        padding: EdgeInsets.all(15.0),
        onPressed: this.onPressed,
        child: this.icon,
        shape: CircleBorder(),
        fillColor: enabled ? secondaryColor : Colors.white24,
        elevation: this.enabled ? 6.0 : 0.0,
      ),
    );
  }
}
