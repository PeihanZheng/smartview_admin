import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartview_admin/themes/colors.dart';

import '../constants/assets.dart';
import '../constants/strings.dart';
import '../themes/textstyles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      Get.offNamed('/dashboard');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                appIcon,
                width: Get.width / 2,
              ),
              const SizedBox(height: 15),
              Text(
                smartViewT,
                style: textstyle.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .5,
                  color: whitecolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
