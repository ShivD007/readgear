import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readgear/app/atoms/Images/custom_asset_image.dart';
import 'package:readgear/app/atoms/buttons/primary_button.dart';
import 'package:readgear/app/atoms/buttons/secondary_button.dart';
import 'package:readgear/app/atoms/custom_spacers.dart';
import 'package:readgear/app/atoms/text_extension.dart';
import 'package:readgear/app/core/constants/image_constants.dart';
import 'package:readgear/app/core/constants/string_constants.dart';
import 'package:readgear/app/core/constants/value_constants.dart';
import 'package:readgear/app/modules/walkThrough/views/Widgets/corousel_item.dart';
import 'package:readgear/app/molecules/custom_carousel.dart';
import 'package:readgear/app/routes/custom_navigator.dart';

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
        child: Stack(
          alignment: Alignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Positioned.fill(
              child: CustomCarousel(
                pageViewFraction: 1,
                height: 844.h,
                showBottomIndicator: false,
                spaceBeforeIndicator: 0.h,
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
            ),

            // CustomSpacers.height20,
            Positioned(
              bottom: 40.h,
              child: SizedBox(
                height: 48.h,
                width: 300.w,
                child: PrimaryButton(
                    btnTitle: LET_GET_STARTED,
                    onClick: () {
                      CustomNavigator.pushTo(Routes.LOGIN_WITH_OTP);
                    },
                    padding: 0.0),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
