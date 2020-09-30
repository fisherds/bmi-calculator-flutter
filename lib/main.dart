import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // Define the default brightness and colors.
        // brightness: Brightness.dark,
        primaryColor: Color(0xFF222244),
        accentColor: Colors.cyan[600],
        scaffoldBackgroundColor: Color(0xFF0A0E21),

        // Define the default font family.
        // fontFamily: 'Georgia',
        // textTheme: TextTheme(
        //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      home: InputPage(),
    );
  }
}
