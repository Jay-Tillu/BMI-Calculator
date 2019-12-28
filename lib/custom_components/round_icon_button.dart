import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function onRoundIconButtonPressed;
  final IconData yourIcon;

  RoundIconButton(
      {@required this.yourIcon, @required this.onRoundIconButtonPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onRoundIconButtonPressed,
      fillColor: Color(0xFF4C4F5E),
      elevation: 10.0,
      child: Icon(yourIcon),
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      shape: CircleBorder(),
    );
  }
}
