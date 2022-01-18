import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirog_street/app/atoms/buttons/primary_button.dart';
import 'package:nirog_street/app/core/app_colors.dart';
import 'package:nirog_street/app/core/constants/string_constants.dart';

class PersistanceButton extends StatelessWidget {
  final Widget widgetlist;
  const PersistanceButton({Key? key, required this.widgetlist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      color: AppColors.COLOR_WHITE,
      child: Center(
        child: SizedBox(height: 48.h, child: widgetlist),
      ),
    );
  }
}
