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
  double _height = 50.h;

  @override
  void initState() {
    super.initState();

    SizerUtil.deviceType == DeviceType.mobile
        ? debugPrint('Device type is Mobile!')
        : debugPrint('Device type is Tablet!');

    Timer(const Duration(milliseconds: 500), () {
      _height = 90.h;
      setState(() {});
    });

    Timer(const Duration(milliseconds: 6000), () {
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
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                height: _height,
                curve: Curves.bounceInOut,
                child: Center(
                  child: Image.asset('assets/movie.png'),
                ),
              ),

              // Add a background
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: AssetImage('assets/splash_bg.png'),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
