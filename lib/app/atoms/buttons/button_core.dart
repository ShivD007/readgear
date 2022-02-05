import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readgear/app/core/app_colors.dart';
import 'package:readgear/app/core/constants/style_constants.dart';
import 'package:readgear/app/core/constants/value_constants.dart';

class ButtonCore extends StatelessWidget {
  final String btnTitle;
  final VoidCallback onClick;
  final bool isPrimary;
  Color? textColor, buttonColor;
  double padding;
  TextStyle? buttonStyle;
  double? fontSize;
  bool? disable;
  bool noBorder;
  ButtonCore(
      {Key? key,
      required this.btnTitle,
      required this.onClick,
      this.padding = 30,
      this.buttonStyle,
      required this.isPrimary,
      this.disable = false,
      this.buttonColor,
      this.noBorder = false,
      this.textColor = AppColors.COLOR_RED_500})
      : super(key: key);

  @override
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: disable! ? () {} : onClick,
        style: ButtonStyle(
          backgroundColor: buttonColor == null
              ? isPrimary
                  ? MaterialStateProperty.all(AppColors.COLOR_RED_500
                      .withOpacity(!disable! ? 1.0 : 0.4))
                  : MaterialStateProperty.all(
                      !disable! ? null : AppColors.COLOR_GREY_200)
              : MaterialStateProperty.all(buttonColor),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: padding)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(VALUE_STANDARD_BUTTON_CORNER_RADIUS),
            ),
          ),
          side: noBorder
              ? null
              : MaterialStateProperty.all(
                  BorderSide(
                      color: (textColor ?? AppColors.COLOR_RED_500)
                          .withOpacity(!disable! ? 1.0 : 0.2),
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
        ),
        child: Text(
          btnTitle,
          textAlign: TextAlign.center,
          style: isPrimary
              ? buttonStyle ?? Style_OpenSans.styleWhite(20.sp)
              : buttonStyle ??
                  Style_OpenSans.styleButton(
                    fontSize: fontSize,
                    color: textColor ?? AppColors.COLOR_RED_500,
                  ),
        ),
      );
}
