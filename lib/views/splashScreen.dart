// ignore_for_file: file_names, unused_local_variable, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tugas1_bmiapp/views/bmi_DataScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const DataScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          width: 300,
          image: AssetImage(
            "assets/images/logoBMI.png",
          ),
        ),
      ),
      // body: Container(
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      //   alignment: Alignment.center,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: Image.asset(
      //           "assets/images/logoBMI.png",
      //           height: 200,
      //           width: 300,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
