import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readgear/app/core/app_colors.dart';
import 'package:readgear/app/core/constants/string_constants.dart';
import 'package:readgear/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:readgear/app/molecules/auth_email_moelcule.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.COLOR_RED_50,
          body: SafeArea(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AuthEmailMolecule(
                    middleWidget: const SizedBox.shrink(),
                    subHeadingTitle: FORGOT_PWD_SUB_HEADING,
                    headingTitle: TROUBLE_LOGIN,
                    buttonClick: controller.onClickGetOtp,
                    buttonTitle: SEND_OTP,
                    emailController: controller.emailPhoneController,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
