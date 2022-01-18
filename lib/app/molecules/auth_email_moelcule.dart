import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirog_street/app/atoms/buttons/primary_button.dart';
import 'package:nirog_street/app/atoms/custom_input.dart';
import 'package:nirog_street/app/atoms/custom_spacers.dart';
import 'package:nirog_street/app/atoms/text_extension.dart';
import 'package:nirog_street/app/core/constants/string_constants.dart';
import 'package:nirog_street/app/core/validation_functions.dart';

class AuthEmailMolecule extends StatelessWidget {
  final String headingTitle, subHeadingTitle, buttonTitle;
  final TextEditingController emailController;
  final VoidCallback buttonClick;
  final Widget middleWidget;
  const AuthEmailMolecule(
      {Key? key,
      required this.headingTitle,
      required this.subHeadingTitle,
      required this.buttonTitle,
      required this.middleWidget,
      required this.emailController,
      required this.buttonClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSpacers.height60,
          headingTitle.h25(),
          CustomSpacers.height14,
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: subHeadingTitle.overline16(maxLines: 2)),
          CustomSpacers.height32,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: CustomInput(
                keyboardType: TextInputType.emailAddress,
                validator: ValidationFunctions.validateEmailPhone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                labelTextFlag: false,
                placeholder: HINT_EMAIL_MOBILE),
          ),
          middleWidget,
          CustomSpacers.height48,
          SizedBox(
            height: 48.h,
            width: 300.w,
            child: PrimaryButton(
              btnTitle: buttonTitle,
              padding: 0.0,
              onClick: () => buttonClick(),
            ),
          ),
        ],
      );
}
