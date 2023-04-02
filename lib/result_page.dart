import 'package:flutter/material.dart';
import 'package:mortgage_calculator/bottom_button.dart';
import 'package:mortgage_calculator/reusable_container.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  final String? bmiValue;
  final String? Result;
  final String? Inter;
  final Gender? gender;
  final int? age;

  ResultPage({this.bmiValue, this.Result, this.Inter, this.gender, this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text(
            'BMI Calculator',
            style: TextStyle(
              color: kTitleColor,
            ),
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ReusableContainer(
                activityBorderColor: kInactiveContainerBorderColor,
                containerChild: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Gender: ${gender.toString().toUpperCase()}',
                      style: kActiveTextStyle,
                    ),
                    Text(
                      'Age: $age',
                      style: kActiveTextStyle,
                    )
                  ],
                )),
              ),
            ),
            Expanded(
              flex: 6,
              child: ReusableContainer(
                activityBorderColor: kInactiveContainerBorderColor,
                containerChild: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Your BMI is',
                        style: kInactiveBMITextStyle,
                      ),
                      Text(
                        '$bmiValue kg/m2',
                        style:
                            TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        '($Result)',
                        style: kInactiveBMITextStyle,
                      ),
                      Text(
                        '$Inter',
                        style: kActiveTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
            BottomButton(onTap: (){
              Navigator.pop(context);
            }, title: 'Recalculate'),
          ],
        ),
      ),
    );
  }
}
