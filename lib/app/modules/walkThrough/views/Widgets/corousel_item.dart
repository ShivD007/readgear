import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readgear/app/atoms/Images/custom_asset_image.dart';

import 'package:readgear/app/atoms/text_extension.dart';
import 'package:readgear/app/core/app_colors.dart';

class CorouselItems extends StatelessWidget {
  final String headingText;
  final String imagePath;
  const CorouselItems(
      {Key? key, required this.headingText, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomAssetImageView(
          height: 844.h,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          imagePath: imagePath,
        ),
        Positioned(
          top: 40.h,
          child: headingText.h25(
              fontSize: 30.sp,
              textColor: AppColors.COLOR_GREY_900,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
