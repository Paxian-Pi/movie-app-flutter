import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'screens/home_screen.dart';
import 'utils/constants.dart';

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
        home: HomeScreen(key: kHomeScreenKey),
      );
    });
  }
}
