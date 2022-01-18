import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirog_street/app/atoms/Images/custom_asset_image.dart';
import 'package:nirog_street/app/atoms/custom_spacers.dart';
import 'package:nirog_street/app/atoms/text_extension.dart';
import 'package:nirog_street/app/core/app_colors.dart';

class CorouselItems extends StatelessWidget {
  final String headingText;
  final String imagePath;
  const CorouselItems({Key? key, required this.headingText, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        headingText.h25(textColor: AppColors.COLOR_BLUE_500),
        CustomSpacers.height56,
        CustomAssetImageView(
          height: 310.h,
          width: 322.w,
          fit: BoxFit.contain,
          imagePath: imagePath,
        ),
      ],
    );
  }
}
