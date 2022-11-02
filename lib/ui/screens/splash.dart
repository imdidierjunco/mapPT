import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mappt/utils/gobal_colors.dart';

import 'home.dart';
import 'inicio.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Get.to(() => const HomeScreen());
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/Logo Didier NB.png',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
