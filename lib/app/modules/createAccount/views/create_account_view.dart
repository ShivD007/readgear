import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nirog_street/app/atoms/buttons/primary_button.dart';
import 'package:nirog_street/app/atoms/buttons/secondary_button.dart';
import 'package:nirog_street/app/atoms/custom_dropdown.dart';
import 'package:nirog_street/app/atoms/custom_input.dart';
import 'package:nirog_street/app/atoms/custom_spacers.dart';
import 'package:nirog_street/app/atoms/text_extension.dart';
import 'package:nirog_street/app/core/app_colors.dart';
import 'package:nirog_street/app/core/constants/string_constants.dart';
import 'package:nirog_street/app/core/constants/value_constants.dart';
import 'package:nirog_street/app/core/validation_functions.dart';
import 'package:nirog_street/app/routes/app_pages.dart';
import 'package:nirog_street/app/routes/custom_navigator.dart';
import '../controllers/create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  CreateAccountView({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.COLOR_BLUE_50,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Column(
                        children: [
                          CustomSpacers.height60,
                          CREATE_AN_ACCOUNT.h25(),
                          CustomSpacers.height32,
                          CustomInput(
                            controller: controller.mobileEditingController,
                            placeholder: MOBILE,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            validator: ValidationFunctions.validatePhone,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                          ),
                          CustomSpacers.height14,
                          CustomInput(
                            controller: controller.emailEditingController,
                            placeholder: EMAIL,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.emailAddress,
                            validator: ValidationFunctions.validateEmail,
                          ),
                          CustomSpacers.height14,
                          CustomInput(
                              controller: controller.pinCodeEditingController,
                              placeholder: PINCODE,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              validator: ValidationFunctions.validatePincode),
                          CustomSpacers.height14,
                          CustomInput(
                            controller:
                                controller.referralCodeEditingController,
                            placeholder: HINT_REFERRAL_CODE,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          CustomSpacers.height14,
                          CustomInput(
                            controller: controller.pwdEditingController,
                            placeholder: HINT_PWD,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: ValidationFunctions.validatePassword,
                            isObscure: true,
                            maxLines: 1,
                          ),
                          CustomSpacers.height14,
                          CustomInput(
                            controller: controller.conPwdEditingController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            isObscure: true,
                            maxLines: 1,
                            placeholder: HINT_CON_PWD,
                            textInputAction: TextInputAction.done,
                            validator: (String? value) =>
                                ValidationFunctions.validatereEnteredPassword(
                              controller.pwdEditingController.text,
                              alrdyEnteredPassword:
                                  controller.conPwdEditingController.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomSpacers.height24,
                    SizedBox(
                      height: 48.h,
                      width: 200.w,
                      child: PrimaryButton(
                        onClick: () async {
                          if (formKey.currentState!.validate()) {
                            await controller.onClickGetOtp();
                          }
                        },
                        btnTitle: GET_OTP,
                        padding: 0.0,
                      ),
                    ),
                    CustomSpacers.height54,
                    SizedBox(
                      height: 48.h,
                      width: 300.w,
                      child: SecondaryButton(
                        onClick: () =>
                            CustomNavigator.pushTo(Routes.LOGIN_WITH_OTP),
                        btnTitle: ALREADY_HAVE_ACCOUNT,
                        padding: 0.0,
                      ),
                    ),
                    CustomSpacers.height40
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
