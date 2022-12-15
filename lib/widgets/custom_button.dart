import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? buttonWidth;
  final Icon? iconWidget;
  final Color? iconBackgroundColor;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? borderWidth;
  final Function? onPressed;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    Key? key,
    required this.text,
    this.textColor,
    this.buttonWidth,
    this.iconWidget,
    this.iconBackgroundColor,
    this.backgroundColor,
    this.borderRadius,
    this.borderWidth,
    this.onPressed,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kMainGreenColor,
      onTap: () => onPressed!(),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          width: buttonWidth ?? 42.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade400,
              width: borderWidth ?? 1,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(10.sp),
            color: backgroundColor,
            // color: Colors.black,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 1.5.h),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconBackgroundColor,
                  ),
                  child: iconWidget,
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? Colors.black,
                    fontSize: 12.sp,
                    shadows: kBoxShadow,
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}