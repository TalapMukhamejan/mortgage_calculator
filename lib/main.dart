import 'package:flutter/material.dart';
import 'package:mortgage_calculator/result_page.dart';
import 'main_page.dart';
import 'constants.dart';

void main() => runApp(BmiCalc());

class BmiCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: kBgColor,
        ),
        scaffoldBackgroundColor: kBgColor,
      ),
      home: InputPage(),
    );
  }
}
