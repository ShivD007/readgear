import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nirog_street/app/atoms/buttons/primary_button.dart';
import 'package:nirog_street/app/atoms/buttons/secondary_button.dart';
import 'package:nirog_street/app/atoms/clickable_text.dart';
import 'package:nirog_street/app/atoms/custom_input.dart';
import 'package:nirog_street/app/atoms/custom_spacers.dart';
import 'package:nirog_street/app/atoms/text_extension.dart';
import 'package:nirog_street/app/core/app_colors.dart';
import 'package:nirog_street/app/core/constants/string_constants.dart';
import 'package:nirog_street/app/core/constants/value_constants.dart';
import 'package:nirog_street/app/core/validation_functions.dart';
import 'package:nirog_street/app/routes/app_pages.dart';
import 'package:nirog_street/app/routes/custom_navigator.dart';
import '../controllers/login_with_otp_controller.dart';

class LoginWithOTPView extends GetView<LoginWithOTPController> {
  LoginWithOTPView({Key? key}) : super(key: key);
  GlobalKey<FormState> loginWithOtpformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomSpacers.height60,
              LOGIN_WELCOME.h25(),
              CustomSpacers.height14,
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: LOGIN_HEADING.overline16()),
              CustomSpacers.height32,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: loginWithOtpformKey,
                  child: CustomInput(
                      keyboardType: TextInputType.emailAddress,
                      validator: ValidationFunctions.validateEmailPhone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.emailPhoneController,
                      labelTextFlag: false,
                      textInputAction: TextInputAction.done,
                      placeholder: HINT_EMAIL_MOBILE),
                ),
              ),
              CustomSpacers.height48,
              SizedBox(
                height: 48.h,
                width: 200.w,
                child: PrimaryButton(
                  btnTitle: GET_OTP,
                  padding: 0.0,
                  onClick: () async {
                    if (loginWithOtpformKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      await controller.onClickGetOtp();
                    }
                  },
                ),
              ),
              CustomSpacers.height40,
            ],
          ),
        ));
  }
}
