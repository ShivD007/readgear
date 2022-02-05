import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readgear/app/atoms/custom_spacers.dart';
import 'package:readgear/app/core/app_colors.dart';
import 'package:readgear/app/core/constants/value_constants.dart';
import 'text_extension.dart';

class CustomCheckBox extends StatelessWidget {
  final Function(bool? value) onChangeCallback;
  final bool? disable;
  final Widget? title;
  final bool? initialValue;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? boxAtLast;
  CustomCheckBox(
      {Key? key,
      required this.onChangeCallback,
      this.title,
      this.initialValue = false,
      this.crossAxisAlignment,
      this.disable = false,
      this.boxAtLast = false})
      : super(key: key);
  late ValueNotifier<bool?> _isChecked;

  @override
  Widget build(BuildContext context) {
    _isChecked = ValueNotifier(initialValue!);
    return ValueListenableBuilder(
        valueListenable: _isChecked,
        builder: (context, bool? checkedValue, _) {
          return Row(
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: boxAtLast!
                ? List<Widget>.from(_widgetList(checkedValue).reversed)
                : _widgetList(checkedValue),
          );
        });
  }

  List<Widget> _widgetList(bool? checkedValue) {
    return <Widget>[
      SizedBox(
        height: 30.h,
        // width: 30.h,
        child: Checkbox(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SMALL_BORDER_RADIUS)),
          value: checkedValue,
          activeColor: AppColors.COLOR_RED_500,
          onChanged: disable!
              ? (newValue) {}
              : (newValue) {
                  _isChecked.value = newValue;
                  onChangeCallback(newValue);
                },
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        ),
      ),
      CustomSpacers.width8,
      Expanded(child: title ?? Container())
    ];
  }
}
