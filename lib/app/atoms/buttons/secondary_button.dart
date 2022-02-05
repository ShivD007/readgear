import 'package:flutter/material.dart';
import 'package:readgear/app/atoms/buttons/button_core.dart';

class SecondaryButton extends ButtonCore {
  SecondaryButton(
      {Key? key,
      required String btnTitle,
      required Function onClick,
      bool? disable,
      Color? textColor,
      double? padding = 30})
      : super(
            key: key,
            btnTitle: btnTitle,
            onClick: () => onClick(),
            isPrimary: false,
            disable: disable ?? false,
            padding: padding!,
            textColor: textColor);
}
