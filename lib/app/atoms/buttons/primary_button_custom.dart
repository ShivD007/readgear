import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readgear/app/core/constants/style_constants.dart';

import '/app/core/app_colors.dart';
import '/app/core/app_themes.dart';
import '/app/core/constants/value_constants.dart';

class PrimaryButtonCustom extends StatelessWidget {
  final String strButtonText;
  final VoidCallback buttonAction;
  final double? height;
  final double? width;
  final double? dCornerRadius;
  final Color borderColor;
  final Color bgColor;
  final Color? textColor;
  final TextAlign buttonTextAlignment;
  final bool bIcon;
  final bool bIconLeft; // By default left will be true
  final Widget? buttonIcon;
  final MainAxisAlignment mainAxisAlignment;

  const PrimaryButtonCustom({
    Key? key,
    required this.strButtonText,
    required this.buttonAction,
    this.dCornerRadius,
    this.borderColor = Colors.transparent,
    this.bgColor = AppColors.COLOR_RED_500,
    this.textColor = AppColors.COLOR_GREY_900,
    this.buttonTextAlignment = TextAlign.center,
    this.bIconLeft = true,
    this.bIcon = false,
    this.buttonIcon,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
    this.height = 50,
    this.width = 120,
  }) : super(key: key);

  factory PrimaryButtonCustom.icon(
      {String strButtonText = '',
      required VoidCallback buttonAction,
      required bool bIconLeft,
      Color borderColor = Colors.transparent,
      Color bgColor = Colors.white,
      Color? textColor = AppColors.COLOR_GREY_900,
      required Widget? icon,
      double? dCornerRadius}) {
    return PrimaryButtonCustom(
      strButtonText: strButtonText,
      buttonAction: buttonAction,
      buttonIcon: icon,
      bIconLeft: bIconLeft,
      bIcon: true,
      dCornerRadius: dCornerRadius,
      borderColor: borderColor,
      bgColor: bgColor,
      textColor: textColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonAction,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(
              dCornerRadius ?? VALUE_STANDARD_BUTTON_CORNER_RADIUS),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            if (bIcon == true && bIconLeft == true)
              Container(color: Colors.transparent, child: buttonIcon!),
            if (strButtonText.isNotEmpty)
              Text(
                strButtonText,
                textAlign: buttonTextAlignment,
                style: AppThemes.ligtTheme.textTheme.button?.copyWith(
                    color: textColor,
                    fontSize: 12.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600),
              ),
            if (bIcon == true && bIconLeft == false)
              Container(
                  //padding: const EdgeInsets.all(5.0),
                  color: Colors.transparent,
                  child: buttonIcon!),
          ],
        ),
      ),
    );
  }
}
