import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:readgear/app/atoms/buttons/primary_button.dart';
import 'package:readgear/app/atoms/clickable_text.dart';
import 'package:readgear/app/atoms/text_extension.dart';
import 'package:readgear/app/core/app_colors.dart';
import 'package:readgear/app/core/constants/string_constants.dart';
import 'package:readgear/app/core/constants/value_constants.dart';
import 'package:readgear/app/modules/verification/controllers/verification_controller.dart';
import 'package:readgear/app/routes/app_pages.dart';
import 'package:readgear/app/routes/custom_navigator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '/app/atoms/custom_spacers.dart';

class VerificationView extends GetView<VerificationController> {
  final VerificationPageType _verificationPageType = Get.arguments;

  VerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.COLOR_RED_50,
      key: controller.scaffoldKey,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 55.h),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CustomSpacers.height60,
                VERIFICATION.h25(),
                CustomSpacers.height14,
                VERIFICATION_HEADING.overline16(),
                CustomSpacers.height32,
                Form(
                  key: controller.formKey,
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    obscureText: false,
                    obscuringCharacter: '*',
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        // return "Please check the code again";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      borderWidth: 0.7,
                      // errorBorderColor: Colors.red,
                      // fieldOuterPadding: EdgeInsetsGeometry.infinity,
                      // disabledColor: Colors.white,
                      activeColor: Colors.black26,
                      inactiveColor: Colors.black26,
                      inactiveFillColor: Colors.white,
                      selectedColor: Colors.black26,
                      selectedFillColor: Colors.white,
                      errorBorderColor: Colors.redAccent,
                      fieldHeight: 60.h,
                      fieldWidth: 60.w,
                      activeFillColor:
                          controller.hasError ? Colors.white : Colors.white,
                    ),
                    cursorColor: Colors.black54,
                    animationDuration: const Duration(milliseconds: 300),
                    textStyle: const TextStyle(fontSize: 20, height: 1),
                    backgroundColor: AppColors.COLOR_RED_50,
                    enableActiveFill: true,
                    errorAnimationController: controller.errorController,
                    controller: controller.textEditingController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.white,
                        blurRadius: 0,
                      )
                    ],
                    onCompleted: (v) {
                      print("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      print(value);
                      controller.currentTextChange(value);
                      controller.errorTextChange = "";
                    },
                    beforeTextPaste: (text) {
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
                Obx(() => Text(
                      controller.errorText.value,
                      style: TextStyle(color: Colors.red, fontSize: 13.sp),
                    )),
                CustomSpacers.height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClickableText(
                        strButtonText: RESEND_OTP,
                        buttonAction: () async {
                          await controller
                              .onClickResendOtp(_verificationPageType);
                        },
                        textColor: AppColors.COLOR_RED_500),
                    const Spacer(),
                    ClickableText(
                        strButtonText: CHANGE_NUMBER,
                        buttonAction: () {
                          CustomNavigator.pushReplacement(
                              Routes.LOGIN_WITH_OTP);
                        },
                        textColor: AppColors.COLOR_RED_500),
                  ],
                ),
                CustomSpacers.height48,
                SizedBox(
                  child: PrimaryButton(
                    btnTitle: PROCEED,
                    onClick: () {
                      controller.verifyOtp(_verificationPageType);
                    },
                    padding: 0.0,
                  ),
                  height: 48.h,
                  width: 200.w,
                ),
                CustomSpacers.height40,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
