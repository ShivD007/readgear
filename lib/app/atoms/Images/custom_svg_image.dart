import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirog_street/app/core/app_colors.dart';
import 'package:nirog_street/app/core/constants/value_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSVGImageView extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? dBorderRadius;
  final ImageShapes shape;
  final VoidCallback clickAction;
  final Color? imageColor;
  const CustomSVGImageView(
      {Key? key,
      required this.imagePath,
      this.height,
      this.width,
      this.shape = ImageShapes.Standard, // Default
      this.dBorderRadius,
      this.clickAction = _defaultFunction,
      this.fit = BoxFit.contain,
      this.imageColor})
      : super(key: key);

  factory CustomSVGImageView.square(
      {required String imagePath,
      double? height,
      double? width,
      BoxFit? fit,
      VoidCallback clickAction = _defaultFunction}) {
    return CustomSVGImageView(
        imagePath: imagePath,
        shape: ImageShapes.Square,
        dBorderRadius: 0,
        fit: fit,
        clickAction: clickAction);
  }
  static _defaultFunction() {
    // Does nothing
  }
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(dBorderRadius ?? 0.0),
      child: SvgPicture.asset(imagePath,
          height: height ?? 12.h, width: width ?? 12.h, color: imageColor),
    );
  }
}
