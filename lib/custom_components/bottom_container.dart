import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String labelText;
  final Function onBottomButtonPressed;

  BottomButton(
      {@required this.labelText, @required this.onBottomButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBottomButtonPressed,
      child: Container(
        child: Center(
          child: Text(
            labelText,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}
