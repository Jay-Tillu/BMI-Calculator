import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_components/bottom_container.dart';
import 'package:bmi_calculator/custom_components/reusable_card.dart';
import 'package:bmi_calculator/custom_components/round_icon_button.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/custom_components/icon_content.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/bmi_calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int userHeight = 120;
  int userWeight = 1;
  int userAge = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//***************   AppBar   **********************
      appBar: AppBar(
        title: Text(
          "Bmi Calulator".toUpperCase(),
        ),
      ),

//***************   Body   ***********************
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
//******************   Upper Row   ********************
            Expanded(
              child: Row(
                children: <Widget>[
//*******************   Male card   ********************
                  Expanded(
                    child: ReusableCard(
                      onReusableCardPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      reusableCardColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        yourIcon: FontAwesomeIcons.mars,
                        textLabel: "Male",
                      ),
                    ),
                  ),

//*******************   female card   ********************
                  Expanded(
                    child: ReusableCard(
                      onReusableCardPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      reusableCardColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        yourIcon: FontAwesomeIcons.venus,
                        textLabel: "Female",
                      ),
                    ),
                  ),
                ],
              ),
            ),

//*******************   Middle Row   *********************
            Expanded(
              child: ReusableCard(
                reusableCardColor: kInActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          userHeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: Slider(
                        max: 220,
                        min: 120,
                        value: userHeight.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            userHeight = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

//*******************   Lower Row   **********************
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      reusableCardColor: kInActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            userWeight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                yourIcon: FontAwesomeIcons.minus,
                                onRoundIconButtonPressed: () {
                                  setState(() {
                                    userWeight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                yourIcon: FontAwesomeIcons.plus,
                                onRoundIconButtonPressed: () {
                                  setState(() {
                                    userWeight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      reusableCardColor: kInActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            userAge.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                yourIcon: FontAwesomeIcons.minus,
                                onRoundIconButtonPressed: () {
                                  setState(() {
                                    userAge--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                yourIcon: FontAwesomeIcons.plus,
                                onRoundIconButtonPressed: () {
                                  setState(() {
                                    userAge++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            BottomButton(
              labelText: "CALCULATE",
              onBottomButtonPressed: () {
                BmiCalculatorBrain bmiCalculatorBrain = BmiCalculatorBrain(
                  height: userHeight,
                  weight: userWeight,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: bmiCalculatorBrain.calculateBMI(),
                      interpretation: bmiCalculatorBrain.getInterpretation(),
                      resultText: bmiCalculatorBrain.getTextResults(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
