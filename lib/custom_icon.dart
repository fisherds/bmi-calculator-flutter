import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon(this.icon, this.label);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(label.toUpperCase(),
            style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)))
      ],
    );
  }
}
