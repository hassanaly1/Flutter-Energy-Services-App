import 'dart:async';

import 'package:energy_services/views/auth/start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const StartScreen(), transition: Transition.rightToLeft);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: Image.asset(
            'assets/images/app-logo.png',
            height: 150,
            width: 150,
          ))),
    );
  }
}
