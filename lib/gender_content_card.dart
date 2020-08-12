import 'package:flutter/material.dart';

import 'constants.dart';

class GenderCardWidget extends StatelessWidget {
  final IconData genderIcon;
  final String gender;

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
          style: kTextStyle,
        )
      ],
    );
  }
}
