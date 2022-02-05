import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:readgear/app/atoms/buttons/primary_button.dart';
import 'package:readgear/app/atoms/custom_input.dart';
import 'package:readgear/app/atoms/custom_spacers.dart';
import 'package:readgear/app/atoms/text_extension.dart';
import 'package:readgear/app/core/app_colors.dart';
import 'package:readgear/app/core/constants/string_constants.dart';
import 'package:readgear/app/core/validation_functions.dart';
import 'package:readgear/app/routes/app_pages.dart';
import 'package:readgear/app/routes/custom_navigator.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  GlobalKey<FormState> passwordformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: passwordformKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomSpacers.height104,
              CHANGE_PASSWORD.h25(),
              CustomSpacers.height14,
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CHANGE_PASSWORD_HEADING.overline16()),
              CustomSpacers.height32,
              GetBuilder<ChangePasswordController>(builder: (controller) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: CustomInput(
                      isObscure: controller.isPasswordVisible,
                      validator: ValidationFunctions.validatePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.done,
                      controller: controller.passwordController,
                      labelTextFlag: false,
                      suffixIcon: InkWell(
                        onTap: () => controller.changePasswordVisibility(),
                        child: Icon(
                          controller.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.COLOR_GREY_500,
                        ),
                      ),
                      placeholder: HINT_PASSWORD),
                );
              }),
              CustomSpacers.height14,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: CustomInput(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        ValidationFunctions.validatereEnteredPassword(value,
                            alrdyEnteredPassword:
                                controller.passwordController.text),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.confPasswordController,
                    labelTextFlag: false,
                    isObscure: true,
                    textInputAction: TextInputAction.done,
                    placeholder: HINT_CON_PWD2),
              ),
              CustomSpacers.height48,
              SizedBox(
                height: 48.h,
                width: 300.w,
                child: PrimaryButton(
                    btnTitle: SAVE,
                    padding: 0.0,
                    onClick: () {
                      if (passwordformKey.currentState!.validate()) {
                        controller.onClickSave();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
