import 'package:flutter/material.dart';
import 'package:movies_app_flutter/widgets/colored_circle.dart';
import 'package:movies_app_flutter/widgets/custom_button.dart';
import 'package:movies_app_flutter/widgets/drawer_item.dart';
import 'package:sizer/sizer.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'package:movies_app_flutter/utils/file_manager.dart' as file;
import 'package:url_launcher/url_launcher.dart';

class DrawerScreen extends StatefulWidget {
  final Function(Color) onColorChange;
  const DrawerScreen({Key? key, required this.onColorChange}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final Uri _url = Uri.parse('https://github.com/Paxian-PI');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_url';
    }
  }

  Color? _textColor;

  @override
  void initState() {
    super.initState();

    getButtonColor();
  }

  void getButtonColor() async {
    _textColor = await file.currentTheme();
    debugPrint('colorzzz = $_textColor');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kPrimaryColor,
        child: Padding(
          padding:
              EdgeInsets.only(top: 10.h, left: 6.w, right: 6.w, bottom: 5.h),
          child: SingleChildScrollView(
            //* Added by Pax
            physics: AlwaysScrollableScrollPhysics(), //* Added by Pax
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DrawerItem(
                  title: kDrawerTitleFirstText,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ColoredCircle(
                        color: kMainGreenColor,
                        onPressed: (color) {
                          file.saveTheme(color: "green");
                          widget.onColorChange(color);
                          _textColor = color;
                        },
                      ),
                      ColoredCircle(
                        color: kMainBlueColor,
                        onPressed: (color) {
                          file.saveTheme(color: "blue");
                          widget.onColorChange(color);
                          _textColor = color;
                        },
                      ),
                      ColoredCircle(
                        color: kMainOrangeColor,
                        onPressed: (color) {
                          file.saveTheme(color: "orange");
                          widget.onColorChange(color);
                          _textColor = color;
                        },
                      ),
                      ColoredCircle(
                        color: kMainPinkColor,
                        onPressed: (color) {
                          file.saveTheme(color: "pink");
                          widget.onColorChange(color);
                          _textColor = color;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                DrawerItem(
                  title: kDrawerTitleSecondText,
                  desc: kDrawerAboutDescText,
                  buttonWidget: ElevatedButton(
                    onPressed: _launchUrl,
                    style: ElevatedButton.styleFrom(
                      onPrimary: _textColor,
                      shadowColor: Colors.grey,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 7.h,
                        alignment: Alignment.center,
                        child: Text(
                          'See Github Profile',
                          style: TextStyle(
                            color: _textColor,
                            fontSize: 12.sp,
                            shadows: kBoxShadow,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // buttonWidget: CustomButton(
                  //   text: 'See Github Profile',
                  //   textColor: Colors.white,
                  //   onPressed: _launchUrl,
                  // ),
                ),
                SizedBox(height: 5.h),
                DrawerItem(
                  title: kDrawerTitleThirdText,
                  desc: kDrawerDependenciesDescText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





// class DrawerScreen extends StatelessWidget {
//   final Function(Color) onColorChange;
//   DrawerScreen({required this.onColorChange});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         color: kPrimaryColor,
//         child: Padding(
//           padding:
//               EdgeInsets.only(top: 10.h, left: 6.w, right: 6.w, bottom: 5.h),
//           child: SingleChildScrollView(
//             //* Added by Pax
//             physics: AlwaysScrollableScrollPhysics(), //* Added by Pax
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 DrawerItem(
//                   title: kDrawerTitleFirstText,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ColoredCircle(
//                         color: kMainGreenColor,
//                         onPressed: (color) {
//                           file.saveTheme(color: "green");
//                           onColorChange(color);
//                         },
//                       ),
//                       ColoredCircle(
//                         color: kMainBlueColor,
//                         onPressed: (color) {
//                           file.saveTheme(color: "blue");
//                           onColorChange(color);
//                         },
//                       ),
//                       ColoredCircle(
//                         color: kMainOrangeColor,
//                         onPressed: (color) {
//                           file.saveTheme(color: "orange");
//                           onColorChange(color);
//                         },
//                       ),
//                       ColoredCircle(
//                         color: kMainPinkColor,
//                         onPressed: (color) {
//                           file.saveTheme(color: "pink");
//                           onColorChange(color);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 DrawerItem(
//                   title: kDrawerTitleSecondText,
//                   desc: kDrawerAboutDescText,
//                   buttonWidget: CustomButton(
//                     text: 'See Github Profile',
//                     textColor: Colors.white,
//                     onPressed: () {},
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 DrawerItem(
//                   title: kDrawerTitleThirdText,
//                   desc: kDrawerDependenciesDescText,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

// }
