import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app_flutter/screens/home_screen.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 5500), () {
      Get.offAll(
        () => HomeScreen(key: kHomeScreenKey),
        duration: const Duration(milliseconds: 400),
        transition: Transition.rightToLeft,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Welcome, please wait...',
                  style: TextStyle(color: kDrawerTextColor, fontSize: 20.sp),
                ),
              ),
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: AssetImage('assets/splash.jpg'),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
