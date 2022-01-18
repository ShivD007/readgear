import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nirog_street/app/atoms/Images/custom_asset_image.dart';
import 'package:nirog_street/app/atoms/buttons/primary_button.dart';
import 'package:nirog_street/app/atoms/buttons/secondary_button.dart';
import 'package:nirog_street/app/atoms/custom_spacers.dart';
import 'package:nirog_street/app/atoms/text_extension.dart';
import 'package:nirog_street/app/core/constants/image_constants.dart';
import 'package:nirog_street/app/core/constants/string_constants.dart';
import 'package:nirog_street/app/core/constants/value_constants.dart';
import 'package:nirog_street/app/modules/walkThrough/views/Widgets/corousel_item.dart';
import 'package:nirog_street/app/molecules/custom_carousel.dart';
import 'package:nirog_street/app/routes/custom_navigator.dart';

import '/app/routes/app_pages.dart';
import '../controllers/walk_through_controller.dart';

class WalkThroughView extends GetView<WalkThroughController> {
  const WalkThroughView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSpacers.height20,
            // CustomAssetImageView(
            //     imagePath: NIROG_STREET_LOGO, height: 41.52.h, width: 102.31.w),
            // CustomSpacers.height40,
            // WALKTROUGH_WELCOME.subtitle20(),
            CustomSpacers.height24,
            CustomCarousel(
              pageViewFraction: 1,
              height: 420.h,
              spaceBeforeIndicator: 60.h,
              enabledIndicatorRadius: min(11.w, 11.h),
              disabledIndicatorRadius: min(10.w, 10.h),
              autoPlay: true,
              widgetList: WALKTHROUGH_CAROUSEL_LIST
                  .map((ele) => CorouselItems(
                        imagePath: ele["imagePath"],
                        headingText: ele["headingText"],
                      ))
                  .toList(),
            ),
            CustomSpacers.height38,
            // SizedBox(
            //     height: 48.h,
            //     width: 300.w,
            //     child: PrimaryButton(
            //         btnTitle: CREATE_AN_ACCOUNT,
            //         onClick: () {
            //           CustomNavigator.pushTo(Routes.CREATE_ACCOUNT);
            //         },
            //         padding: 0.0)),
            // CustomSpacers.height20,
            SizedBox(
              height: 48.h,
              width: 300.w,
              child: SecondaryButton(
                  btnTitle: LET_GET_STARTED,
                  onClick: () {
                    CustomNavigator.pushTo(Routes.LOGIN_WITH_OTP);
                  },
                  padding: 0.0),
            ),
            CustomSpacers.height20
          ],
        ),
      )),
    );
  }
}
