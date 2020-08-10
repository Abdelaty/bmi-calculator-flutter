import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color mColor;
  final Widget cardChild;

  ReusableCard({@required this.mColor, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: mColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}
