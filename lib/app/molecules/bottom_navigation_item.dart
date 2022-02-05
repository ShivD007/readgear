import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readgear/app/atoms/Images/custom_asset_image.dart';
import 'package:readgear/app/core/app_colors.dart';

import '/app/core/constants/style_constants.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color? color;
  final VoidCallback? callback;
  const CustomBottomNavigationBarItem(
      {Key? key,
      required this.imagePath,
      required this.title,
      this.color = AppColors.COLOR_GREY_500,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(60.0.w, 15.0.h, 60.0.w, 0.0),
      child: GestureDetector(
        onTap: callback,
        child: Column(
          children: [
            CustomAssetImageView(
              imagePath: imagePath,
            ),
            Text(
              title,
              style: color == AppColors.COLOR_GREY_500
                  ? Style.styleHeaderCardSubHeading
                  : Style.styleHeaderCardBlueSubHeading,
            )
          ],
        ),
      ),
    );
  }
}
