import 'package:flutter/material.dart';
import 'constants.dart';

class GenderIcon extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color iconColor;

  GenderIcon(
      {required this.title, required this.iconData, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          iconData,
          size: 100,
          color: iconColor,
        ),
        Text(
          title,
          style: kActiveTextStyle,
        ),
      ],
    );
  }
}
