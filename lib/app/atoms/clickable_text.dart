import 'package:flutter/material.dart';
import 'package:readgear/app/core/app_colors.dart';
import 'text_extension.dart';

class ClickableText extends StatelessWidget {
  final String strButtonText;
  final VoidCallback buttonAction;
  final Color? textColor;
  final TextAlign? textAlignment;
  final bool? isLabelStyle;

  const ClickableText(
      {Key? key,
      required this.strButtonText,
      required this.buttonAction,
      this.textColor,
      this.textAlignment,
      this.isLabelStyle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: buttonAction,
        child: !isLabelStyle!
            ? strButtonText.overline16(
                textAlign: textAlignment ?? TextAlign.center,
                textColor: textColor ?? AppColors.COLOR_RED_500)
            : strButtonText.label10(
                textAlign: textAlignment ?? TextAlign.center,
                textColor: textColor ?? AppColors.COLOR_RED_500));
  }
}
