import 'package:flutter/material.dart';
import 'package:mortgage_calculator/result_page.dart';
import 'constants.dart';
import 'reusable_container.dart';
import 'gender_icon.dart';
import 'weight_slider/weight_slider.dart';
import 'age_button.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 169;
  int weight = 75;
  int age = 21;

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
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableContainer(
                        activityBorderColor: selectedGender == Gender.male
                            ? kActiveContainerBorderColor
                            : kInactiveContainerBorderColor,
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        containerChild: GenderIcon(
                          title: 'MALE',
                          iconData: Icons.male,
                          iconColor: kSelectedTextColor,
                        ),
                        //
                      ),
                    ),
                    Expanded(
                      child: ReusableContainer(
                        activityBorderColor: selectedGender == Gender.female
                            ? kActiveContainerBorderColor
                            : kInactiveContainerBorderColor,
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        containerChild: GenderIcon(
                          title: 'FEMALE',
                          iconData: Icons.female,
                          iconColor: Color(0xFFe54d84),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableContainer(
                  activityBorderColor: kInactiveContainerBorderColor,
                  containerChild: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Height (in cm)',
                          style: kActiveTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                  color: kActiveContainerBorderColor),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('cm', style: kActiveTextStyle),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: kUnselectedTextColor,
                            activeTrackColor: kActiveContainerBorderColor,
                            overlayColor: kTitleTransparentColor,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableContainer(
                        activityBorderColor: kInactiveContainerBorderColor,
                        containerChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Weight (in kg)',
                              style: kActiveTextStyle,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: WeightSlider(
                                height: 60,
                                weight: weight,
                                minWeight: 45,
                                maxWeight: 125,
                                unit: '',
                                onChange: (int newWeight) {
                                  setState(() {
                                    weight = newWeight;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableContainer(
                        activityBorderColor: kInactiveContainerBorderColor,
                        containerChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Age',
                              style: kActiveTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AgeButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    iconData: Icons.remove),
                                Text(
                                  age.toString(),
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: kTitleColor,
                                      fontWeight: FontWeight.w900),
                                ),
                                AgeButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    iconData: Icons.add),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                  onTap: () {
                    setState(() {
                      CalculatorBrian calc =
                          CalculatorBrian(height: height, weight: weight);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            age: age,
                            gender: selectedGender,
                            bmiValue: calc.calculateBMI(),
                            Result: calc.getResult(),
                            Inter: calc.getInter(),
                          ),
                        ),
                      );
                    });
                  },
                  title: 'Calculate'),
            ],
          ),
        ),
      ),
    );
  }
}
