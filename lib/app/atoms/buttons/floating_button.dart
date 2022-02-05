import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/app/core/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final double? elevation;
  final VoidCallback? callback;
  const CustomFloatingActionButton(
      {Key? key, required this.icon, this.elevation = 0, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0.h,
      width: 64.0.h,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: callback,
          child: Icon(
            icon,
            color: AppColors.COLOR_WHITE,
          ),
          backgroundColor: AppColors.COLOR_RED_500,
          elevation: elevation,
        ),
      ),
    );
  }
}
