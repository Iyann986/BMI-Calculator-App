// ignore_for_file: unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas1_bmiapp/constants/constants.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;
  Color? bmiStatusColor;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    // this.bmi = bmi;
  }

  double calculateBmi() {
    double heightInMeter = height! / 100;

    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;

    return bmi!;
  }

  String determineBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = underweightSevere;
      bmiStatusColor = Colors.red;
    } else if (bmi! < 17) {
      category = underweightModerate;
      bmiStatusColor = Colors.red;
    } else if (bmi! < 18.5) {
      category = underweightMild;
      bmiStatusColor = Colors.red;
    } else if (bmi! < 25) {
      category = normal;
      bmiStatusColor = Colors.green;
    } else if (bmi! < 30) {
      category = overweight;
      bmiStatusColor = Colors.orange;
    } else if (bmi! < 35) {
      category = obeseI;
      bmiStatusColor = Colors.pink;
    } else if (bmi! < 40) {
      category = obeseII;
      bmiStatusColor = Colors.pink;
    } else if (bmi! >= 40) {
      category = obeseIII;
      bmiStatusColor = Colors.pink;
    }
    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealRiskDescription() {
    String desc = "";
    switch (bmiCategory!) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;

      case normal:
        desc = "Low risk (healthy range).";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome.";
        break;

      default:
    }
    bmiDescription = desc;
    return desc;
  }
}
