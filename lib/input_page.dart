import 'package:bmi_calculator/container_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_icon.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                ContainerCard(
                  child: CustomIcon(FontAwesomeIcons.mars, "male"),
                ),
                ContainerCard(
                  child: CustomIcon(FontAwesomeIcons.venus, "female"),
                ),
              ],
            ),
          ),
          ContainerCard(),
          Expanded(
            child: Row(
              children: [
                ContainerCard(
                  child: Text("Hello"),
                ),
                ContainerCard(),
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
