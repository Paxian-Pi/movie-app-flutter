import 'package:get/get.dart';
import 'package:movies_app_flutter/utils/constants.dart';

class AppState extends GetxController {
  var themeColor = kMainGreenColor.obs;

  void setThemeColor(value) => themeColor.value = value;
}
