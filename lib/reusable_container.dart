import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableContainer extends StatelessWidget {
  final Widget? containerChild;
  final VoidCallback? onTap;
  late final Color activityBorderColor;

  ReusableContainer({this.onTap, this.containerChild, required this.activityBorderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kBgColor,
          border: Border.all(width: 3, color: activityBorderColor),
        ),
        margin: EdgeInsets.all(5),
        child: containerChild,
      ),
    );
  }
}