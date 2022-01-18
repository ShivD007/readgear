import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirog_street/app/atoms/text_extension.dart';
import 'package:nirog_street/app/core/app_colors.dart';
import 'package:nirog_street/app/core/constants/image_constants.dart';
import 'package:nirog_street/app/core/constants/value_constants.dart';

import 'Images/custom_svg_image.dart';

class CustomChip extends StatelessWidget {
  const CustomChip(
      {Key? key,
      this.onDeleted,
      this.elevation,
      this.bColor,
      this.borderRadius,
      required this.label,
      this.icon,
      this.iconVisible = false,
      this.textColor = AppColors.COLOR_GREY_800})
      : super(key: key);
  final VoidCallback? onDeleted;
  final double? elevation;
  final double? borderRadius;
  final Color? bColor;
  final Color? textColor;

  final String label;
  final Widget? icon;
  final bool? iconVisible;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Container(
          constraints: BoxConstraints(minWidth: iconVisible! ? 40 : 48),
          child: label.body16(textColor: textColor)),
      deleteIcon: iconVisible!
          ? icon ??
              CustomSVGImageView(
                  imagePath: ICON_CROSS_SVG, imageColor: textColor)
          : const Icon(null),
      deleteIconColor: textColor,
      onDeleted: onDeleted,
      elevation: elevation ?? 4,
      backgroundColor: bColor ?? AppColors.COLOR_GREY_200,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? VALUE_INPUT_BORDER_RADIUS)),
      labelPadding: EdgeInsets.only(right: 2),
    );
  }
}
