// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, avoid_print, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tugas1_bmiapp/constants/constants.dart';
import 'package:tugas1_bmiapp/helpers/bmi_calculator.dart';
import 'package:tugas1_bmiapp/views/bmi_ResultScreen.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int height = 100;
  int weight = 50;
  int age = 25;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    child: BmiCard(
                      bordercolor:
                          (gender == "male") ? Colors.white : primaryColor,
                      child: GenderIconText(
                        icon: Icons.man,
                        title: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      bordercolor:
                          (gender == "female") ? Colors.white : primaryColor,
                      child: GenderIconText(
                        icon: Icons.girl,
                        title: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: labelTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$height",
                          style: numberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      thumbColor: Colors.red,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      value: height.toDouble(),
                      min: 80,
                      max: 200,
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          /*WEIGHT*/
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: labelTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$weight",
                            style: numberTextStyle,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  weight = weight + 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                shape: CircleBorder(),
                                fillColor: Colors.blueGrey,
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  weight = weight - 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                shape: CircleBorder(),
                                fillColor: Colors.blueGrey,
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  /*AGE*/
                  Expanded(
                    child: BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: labelTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$age",
                            style: numberTextStyle,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  age = age + 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                shape: CircleBorder(),
                                fillColor: Colors.blueGrey,
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  age = age - 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.remove,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Colors.blueGrey,
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              final bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBmi();

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ResultScreen(
                      bmi: bmiCalculator.bmi!,
                    );
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 55,
                child: Center(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.bordercolor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? bordercolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff221E5A),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: bordercolor!,
        ),
      ),
      margin: EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
