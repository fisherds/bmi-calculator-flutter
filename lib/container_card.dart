import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  ContainerCard(
      {this.backgroundColor = const Color(0xFF11D1E33),
      this.child,
      this.onTapAction});

  final Color backgroundColor;
  final Widget child;
  final Function onTapAction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onTapAction != null) {
            onTapAction();
          }
        },
        child: Container(
          child: child,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
