import 'package:flutter/material.dart';
import 'package:movies_app_flutter/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';
import 'package:movies_app_flutter/utils/constants.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final Widget? child;
  final Widget? buttonWidget;
  final String? desc;

  DrawerItem({required this.title, this.child, this.buttonWidget, this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.0.w),
          child: Text(
            title,
            style: kBoldTitleTextStyle,
          ),
        ),
        Divider(
          color: kDrawerLineColor,
          height: 3.h,
          thickness: 0.1.h,
        ),
        child ??
            Container(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Text(
                  desc!,
                  style: kDrawerDescTextStyle,
                ),
              ),
            ),
        SizedBox(height: 1.h),
        buttonWidget ?? Container()
      ],
    );
  }
}
