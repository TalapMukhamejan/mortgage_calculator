import 'package:flutter/material.dart';

const kBgColor = Color(0xFFF9FAFD);

enum Gender {
male,
female,
}

const kTitleColor = Color(0xFF090f27);

const kTitleMoreTransparentColor = Color(0x40090f27);

const kTitleTransparentColor = Color(0x80090f27);

const kInactiveContainerBorderColor = Color(0xFFededed);

const kActiveContainerBorderColor = Color(0xFF171a27);

const kActiveTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: kTitleColor,
);

const kInactiveTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color(0xFFb8b9bb),
);

const kInactiveBMITextStyle = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
  color: Color(0xFFb8b9bb),
);

const kSelectedTextColor = Color(0xFFf1965e);

const kUnselectedTextColor = Color(0xFFb8b9bb);
