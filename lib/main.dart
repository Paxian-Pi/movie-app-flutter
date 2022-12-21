import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app_flutter/screens/splash_screen.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies App',
        theme: ThemeData.dark().copyWith(
          platform: TargetPlatform.iOS,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        // home: SplashScreen(),
        home: SizerUtil.deviceType == DeviceType.mobile
            ? Container(
                width: 100.w,
                height: 20.5.h,
                child: SplashScreen(),
              )
            : Container(
                width: 100.w,
                height: 12.5.h,
                child: SplashScreen(),
              ),
      );
    });
  }
}
