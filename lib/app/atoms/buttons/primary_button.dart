import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirog_street/app/atoms/buttons/button_core.dart';

class PrimaryButton extends ButtonCore {
  PrimaryButton(
      {Key? key,
      required String btnTitle,
      required VoidCallback onClick,
      bool? disable,
      double? fontSize,
      double? padding = 30})
      : super(
            key: key,
            btnTitle: btnTitle,
            onClick: onClick,
            disable: disable ?? false,
            isPrimary: true,
            padding: padding!);
}
