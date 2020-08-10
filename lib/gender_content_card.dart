import 'package:flutter/material.dart';

class GenderCardWidget extends StatelessWidget {
  final IconData genderIcon;
  final String gender;
  TextStyle textStyle = TextStyle(
    fontSize: 18.0,
    color: Color(0xFF8D8E98),
  );

  GenderCardWidget({@required this.genderIcon, @required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: textStyle,
        )
      ],
    );
  }
}
