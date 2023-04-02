import 'package:flutter/material.dart';
import 'constants.dart';

class AgeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  AgeButton({required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: 40,
        height: 40,
      ),
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: kTitleMoreTransparentColor, width: 2),
      ),
      child: Icon(iconData, color: kTitleMoreTransparentColor, size: 40),
    );
  }
}