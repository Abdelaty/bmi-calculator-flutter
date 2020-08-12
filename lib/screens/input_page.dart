import 'package:bmi_calculator/components/gender_content_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'file:///E:/Flutter/projects/bmi-calculator-flutter/lib/components/reuseable_card.dart';
import 'file:///E:/Flutter/projects/bmi-calculator-flutter/lib/screens/results_page.dart';

import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 12;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  mColor: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: GenderCardWidget(
                    genderIcon: FontAwesomeIcons.mars,
                    gender: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  mColor: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: GenderCardWidget(
                    genderIcon: FontAwesomeIcons.venus,
                    gender: 'FEMALE',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  mColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: kBoldTextStyle),
                          Text(
                            'cm',
                            style: kTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            overlayColor: Color(0x15EB1555),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0)),
                        child: Slider(
                          value: height.toDouble(),
                          min: kMinimumHeight,
                          max: kMaximumHeight,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  mColor: kActiveCardColor,
                  cardChild: Column(
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kBoldTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                decreaseWeight();
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                increaseWeight();
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  mColor: kActiveCardColor,
                  cardChild: Column(
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kBoldTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                decreaseAge();
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                increaseAge();
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        CalculateButton(
          title: 'CALCULATE',
          onTap: () {
            CalculatorBrain calc =
                CalculatorBrain(height: height, weight: weight);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultPage(
                        bmiResult: calc.calculateBMI(),
                        interpretation: calc.getInterpretation().toUpperCase(),
                        resultText: calc.getResult().toUpperCase(),
                      )),
            );
          },
        ),
      ]),
    );
  }

  decreaseWeight() {
    setState(() {
      weight > 60 ? weight-- : print('Weight out of range');
    });
  }

  decreaseAge() {
    setState(() {
      age > 10 ? age-- : print('Age out of range');
    });
  }

  increaseAge() {
    setState(() {
      age <= 99 ? age++ : print('Age out of range');
    });
  }

  increaseWeight() {
    setState(() {
      weight < 250 ? weight++ : print('Weight out of range');
    });
  }
}

enum Gender {
  male,
  female,
}
