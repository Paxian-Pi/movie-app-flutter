import 'package:get/get.dart';
import 'package:movies_app_flutter/utils/constants.dart';

class AppState extends GetxController {
  var themeColor = kMainGreenColor.obs;

  void setTheme(value) => themeColor.value = value;
}
