import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Function onReusableCardPressed;
  final Color reusableCardColor;
  final Widget cardChild;

  ReusableCard(
      {@required this.cardChild,
      this.onReusableCardPressed,
      this.reusableCardColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onReusableCardPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: reusableCardColor,
        ),
      ),
    );
  }
}
