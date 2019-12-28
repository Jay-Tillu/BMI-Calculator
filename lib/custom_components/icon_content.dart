import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final IconData yourIcon;
  final String textLabel;

  IconContent({@required this.yourIcon, @required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          yourIcon,
          size: 60,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          textLabel.toUpperCase(),
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
