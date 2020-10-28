import 'package:bmi_calculator/container_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'custom_icon.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 43;

  makeGenderCard(Gender genderType) {
    return ContainerCard(
      child: CustomIcon(
        genderType == Gender.male
            ? FontAwesomeIcons.mars
            : FontAwesomeIcons.venus,
        genderType == Gender.male ? "male" : "female",
      ),
      backgroundColor:
          genderType == selectedGender ? kActiveCardColor : kInactiveCardColor,
      onTapAction: () {
        setState(() {
          selectedGender = genderType;
        });
      },
    );
  }

  makeAdjustableNumberCard(title, value, minusFcn, plusFcn) {
    return ContainerCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: kStandardTextStyle,
          ),
          Text(
            value.toString(),
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                iconData: FontAwesomeIcons.minus,
                onPressed: () {
                  setState(() {
                    value = value - 10;
                    minusFcn();
                  });
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              RoundIconButton(
                iconData: FontAwesomeIcons.plus,
                onPressed: () {
                  setState(() {
                    plusFcn();
                  });
                },
              ),
              // FloatingActionButton(
              //     backgroundColor: Color(0xFF4C4F5E),
              //     child: Icon(Icons.add),
              //     onPressed: null),
              // FloatingActionButton(
              //     backgroundColor: Color(0xFF4C4F5E),
              //     child: Icon(Icons.remove),
              //     onPressed: null)
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                makeGenderCard(Gender.male),
                makeGenderCard(Gender.female),
              ],
            ),
          ),
          ContainerCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: kStandardTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text('cm')
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0,
                    ),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 30.0,
                    ),
                  ),
                  child: Slider(
                    max: 220.0,
                    min: 120.0,
                    activeColor: Color(0xFFEB1555),
                    value: height.toDouble(),
                    onChanged: (double sliderValue) {
                      setState(() {
                        height = sliderValue.round();
                        //print("The slider changed to $sliderValue");
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                makeAdjustableNumberCard("WEIGHT", weight, () {
                  weight--;
                }, () {
                  weight++;
                }),
                makeAdjustableNumberCard("AGE", age, () {
                  age--;
                }, () {
                  age++;
                }),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              //print("Navigate me!");
              Navigator.pushNamed(context, "/results");
            },
            child: Container(
              child: Center(child: Text("CALCULATE", style: kButtonTextStyle)),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            ),
          )
        ],
      ),

      // floatingActionButton: Theme(
      //   data: ThemeData(accentColor: Colors.pink),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  RoundIconButton({@required this.iconData, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Icon(iconData),
      fillColor: Color(0xAA4C4F5E),
    );
  }
}
