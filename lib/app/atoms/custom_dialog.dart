import 'package:flutter/material.dart';
import 'package:nirog_street/app/core/constants/value_constants.dart';
import '/app/core/constants/style_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirog_street/app/atoms/text_extension.dart';

class CustomDialog extends StatelessWidget {
  final List<Widget>? actions;
  final String title;
  final String? content;
  final MainAxisAlignment actionsAlignment;
  const CustomDialog({
    Key? key,
    this.actions,
    required this.title,
    this.content,
    required this.actionsAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: Style.styleHeaderCardHeadingMontserrat,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(VALUE_AVATAR_ICON_CORNER_RADIUS),
      ),
      title: title.h25(),
      content: content == null ? null : content!.overline16(),
      insetPadding: EdgeInsets.all(20.0.h),
      contentPadding: EdgeInsets.only(
          left: 35.0.h, right: 35.0.h, top: 10.0.h, bottom: 20.0.h),
      actionsAlignment: actionsAlignment,
      actionsPadding:
          EdgeInsets.only(right: 18.0.h, left: 18.0.h, bottom: 12.0.h),
      actions: actions,
    );
  }
}
