import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  BottomButton({required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kTitleMoreTransparentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(5),
        height: 50,
        child: Center(
          child: Text(
            title,
            style: kActiveTextStyle,
          ),
        ),
      ),
    );
  }
}