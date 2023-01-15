// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, unused_import, must_be_immutable, depend_on_referenced_packages

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tugas1_bmiapp/constants/constants.dart';
import 'package:tugas1_bmiapp/helpers/bmi_calculator.dart';
import 'package:tugas1_bmiapp/views/bmi_DataScreen.dart';

import 'package:pretty_gauge/pretty_gauge.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.bmi,
  });
  final double bmi;

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    bmiCalculator.determineBmiCategory();
    bmiCalculator.getHealRiskDescription();

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Result",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bmiCalculator.bmiCategory!,
                        style: TextStyle(
                          color: Colors.greenAccent[400],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PrettyGauge(
                        gaugeSize: 300,
                        minValue: 0,
                        maxValue: 40,
                        segments: [
                          GaugeSegment('UnderWeight', 18.5, Colors.red),
                          GaugeSegment('Normal', 6.4, Colors.green),
                          GaugeSegment('OverWeight', 5, Colors.orange),
                          GaugeSegment('Obese', 10.1, Colors.pink),
                        ],
                        valueWidget: Text(
                          bmi.toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        currentValue: bmi.toDouble(),
                        needleColor: Colors.blue,
                      ),
                      // Text(
                      //   bmi.toStringAsFixed(1),
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 100,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      Text(
                        bmiCalculator.bmiDescription!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
                    "RE-CALCULATE",
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
