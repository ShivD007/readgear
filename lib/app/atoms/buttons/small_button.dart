import 'package:flutter/material.dart';
import 'package:nirog_street/app/atoms/buttons/button_core.dart';
import 'package:nirog_street/app/core/app_colors.dart';
import 'package:nirog_street/app/core/constants/style_constants.dart';

class PrimarySmallButton extends ButtonCore {
  PrimarySmallButton(
      {Key? key,
      required String btnTitle,
      required VoidCallback onClick,
      TextStyle? buttonStyle,
      Color? buttonColor,
      bool noBorder = false,
      double? padding = 10})
      : super(
            key: key,
            btnTitle: btnTitle,
            onClick: onClick,
            isPrimary: true,
            padding: padding!,
            noBorder: noBorder,
            buttonColor: buttonColor,
            buttonStyle: buttonStyle ??
                Style_OpenSans.style14Normal(AppColors.COLOR_WHITE));

// @override
// Widget build(BuildContext context) => Padding(
//       padding: const EdgeInsets.all(13.0),
//       child: super.build(context),
//     );
}

class SecondarySmallButton extends ButtonCore {
  SecondarySmallButton(
      {Key? key,
      required String btnTitle,
      required VoidCallback onClick,
      Color? buttonColor,
      Color? textColor = AppColors.COLOR_BLUE_500,
      double? padding = 10})
      : super(
            key: key,
            btnTitle: btnTitle,
            onClick: onClick,
            isPrimary: false,
            padding: padding!,
            textColor: textColor,
            buttonColor: buttonColor,
            buttonStyle: Style_Inter.interSemibold_14px(textColor));
// @override
// Widget build(BuildContext context) => Padding(
//       padding: const EdgeInsets.all(13.0),
//       child: super.build(context),
//     );
}
