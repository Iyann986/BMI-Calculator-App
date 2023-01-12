// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tugas1_bmiapp/constants/constants.dart';
import 'package:tugas1_bmiapp/views/bmi_DataScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
        ),
        primarySwatch: Colors.blue,
      ),
      home: DataScreen(),
    );
  }
}
