import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirog_street/app/atoms/custom_spacers.dart';
import 'package:nirog_street/app/core/app_colors.dart';
import 'text_extension.dart';

class CustomRadio<T> extends StatelessWidget {
  final void Function(T?) onChangeCallback;
  final Widget? title;
  final T? value;
  final T groupValue;

  final CrossAxisAlignment? crossAxisAlignment;
  CustomRadio(
      {Key? key,
      required this.onChangeCallback,
      required this.groupValue,
      this.title,
      this.value,
      this.crossAxisAlignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<T?> _isChecked = ValueNotifier(value!);
    return ValueListenableBuilder(
        valueListenable: _isChecked,
        builder: (context, T? checkedValue, _) {
          return Row(
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
                child: Radio<T?>(
                  groupValue: groupValue,
                  value: checkedValue,
                  activeColor: AppColors.COLOR_BLUE_500,
                  onChanged: (T? value) {
                    _isChecked.value = value;
                    onChangeCallback(value);
                  },
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                ),
              ),
              CustomSpacers.width8,
              Expanded(child: title ?? Container())
            ],
          );
        });
  }
}
