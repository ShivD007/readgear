import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nirog_street/app/atoms/Images/custom_asset_image.dart';
import 'package:nirog_street/app/core/constants/image_constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var controller = Get.put(
    SplashController(),
  );

  @override
  void initState() {
    controller.setSplashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomAssetImageView(
              fit: BoxFit.fill,
              imagePath: NIROG_STREET_LOGO,
              height: 91.h,
              width: 224.w,
            ),
          ],
        ),
      ),
    );
  }
}
