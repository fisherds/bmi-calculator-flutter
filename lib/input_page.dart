import 'package:bmi_calculator/container_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_icon.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
// const inactiveCardColor = Colors.red;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = activeCardColor;
  Color femaleCardColor = inactiveCardColor;

  genderCardTap(Gender selectedGender) {
    setState(() {
      // print("Pressed $selectedGender");
      if (selectedGender == Gender.male) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
        femaleCardColor = activeCardColor;
      }
    });
  }

  makeGenderCard(Gender genderType) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          genderCardTap(genderType);
        },
        child: ContainerCard(
          child: CustomIcon(
            genderType == Gender.male
                ? FontAwesomeIcons.mars
                : FontAwesomeIcons.venus,
            genderType == Gender.male ? "male" : "female",
          ),
          backgroundColor:
              genderType == Gender.male ? maleCardColor : femaleCardColor,
        ),
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
        children: [
          Expanded(
            child: Row(
              children: [
                makeGenderCard(Gender.male),
                makeGenderCard(Gender.female),
              ],
            ),
          ),
          Expanded(child: ContainerCard()),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ContainerCard()),
                Expanded(child: ContainerCard()),
              ],
            ),
          ),
          // ContainerCard(
          //   backgroundColor: Color(0xFFEB1555),
          // ),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
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
