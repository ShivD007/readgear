import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readgear/app/atoms/clickable_text.dart';
import 'package:readgear/app/atoms/custom_input.dart';
import 'package:readgear/app/atoms/custom_spacers.dart';
import 'package:readgear/app/core/app_colors.dart';
import 'package:readgear/app/core/constants/string_constants.dart';
import 'package:readgear/app/routes/app_pages.dart';
import 'package:readgear/app/routes/custom_navigator.dart';
import '../controllers/login_with_password_controller.dart';
import 'package:readgear/app/modules/loginWithPassword/controllers/login_with_password_controller.dart';
import 'package:readgear/app/molecules/auth_email_moelcule.dart';

class LoginWithPasswordView extends GetView<LoginWithPasswordController> {
  LoginWithPasswordView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AuthEmailMolecule(
                      middleWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomSpacers.height14,
                          GetBuilder<LoginWithPasswordController>(
                              builder: (controller) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.h),
                                    child: CustomInput(
                                        isObscure: controller.isPasswordVisible,
                                        maxLines: 1,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        textInputAction: TextInputAction.done,
                                        controller:
                                            controller.passwordController,
                                        labelTextFlag: false,
                                        suffixIcon: InkWell(
                                          onTap: () => controller
                                              .changePasswordVisibility(),
                                          child: Icon(
                                            controller.isPasswordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: AppColors.COLOR_GREY_500,
                                          ),
                                        ),
                                        placeholder: HINT_PASSWORD),
                                  )),
                          CustomSpacers.height14,
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: ClickableText(
                                strButtonText: FORGOT_PASSWORD,
                                textColor: AppColors.COLOR_RED_500,
                                buttonAction: () => CustomNavigator.pushTo(
                                    Routes.FORGOT_PASSWORD)),
                          ),
                        ],
                      ),
                      subHeadingTitle: LOGIN_HEADING,
                      headingTitle: LOGIN_WELCOME,
                      buttonClick: () async {
                        if (formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          await controller.onClickProceed();
                        }
                      },
                      buttonTitle: PROCEED,
                      emailController: controller.emailPhoneController,
                    ),
                    CustomSpacers.height40,
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
