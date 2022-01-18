import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirog_street/app/atoms/buttons/primary_button.dart';
import 'package:nirog_street/app/atoms/buttons/secondary_button.dart';
import 'package:nirog_street/app/atoms/custom_spacers.dart';
import 'package:nirog_street/app/atoms/text_extension.dart';
import 'package:nirog_street/app/core/app_colors.dart';
import 'package:nirog_street/app/core/constants/string_constants.dart';
import 'package:nirog_street/app/core/constants/style_constants.dart';
import 'package:nirog_street/app/core/constants/value_constants.dart';
import 'package:nirog_street/app/routes/custom_navigator.dart';

List<int> _getYearsInBetween(DateTime startDate, DateTime endDate) {
  List<int> _years = [];
  for (int i = startDate.year; i <= endDate.year; i++) {
    _years.add(i);
  }
  return _years;
}

CustomYearCalender(
    {required Function(String?) onSubmit,
    required BuildContext context,
    String? initialYear,
    bool looping = true}) {
  return showDialog(
      context: context,
      builder: (context) {
        final _currentDate = DateTime.now();

        List<int> _yearList = _getYearsInBetween(
            DateTime(
                _currentDate.year - 100, _currentDate.month, _currentDate.day),
            _currentDate);

        int? _selectedYearIndex = initialYear != null
            ? initialYear != "" && initialYear.isNotEmpty
                ? _yearList.indexWhere(
                    (e) => e.toString().trim() == initialYear.trim())
                : _yearList.length - 1
            : _yearList.length - 1;

            
        return AlertDialog(
          titleTextStyle: Style.styleHeaderCardHeadingMontserrat,
          shape: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(VALUE_AVATAR_ICON_CORNER_RADIUS),
          ),
          title: SELECT_YEAR.h25(),
          content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: CupertinoPicker(
                  itemExtent: 50.h,
                  looping: looping,
                  scrollController: FixedExtentScrollController(
                      initialItem: initialYear != null
                          ? _yearList.indexWhere(
                              (e) => e.toString().trim() == initialYear.trim())
                          : _yearList.length - 1),
                  selectionOverlay:
                      const CupertinoPickerDefaultSelectionOverlay(),
                  onSelectedItemChanged: (int? index) {
                    if (index != null) _selectedYearIndex = index;
                  },
                  children: _yearList
                      .asMap()
                      .entries
                      .map((e) => Center(
                            child: e.value.toString().subtitle20(
                                textColor: AppColors.COLOR_GREY_900),
                          ))
                      .toList())),
          insetPadding: EdgeInsets.all(20.0.h),
          contentPadding: EdgeInsets.only(
              left: 8.0.h, right: 8.0.h, top: 10.0.h, bottom: 10.0.h),
          actionsAlignment: MainAxisAlignment.end,
          actionsPadding:
              EdgeInsets.only(right: 18.0.h, left: 18.0.h, bottom: 12.0.h),
          actions: [
            SizedBox(
              width: 100.w,
              child: SecondaryButton(
                btnTitle: CANCEL,
                onClick: () {
                  CustomNavigator.pop();
                  onSubmit(null);
                },
                padding: 0,
              ),
            ),
            CustomSpacers.width12,
            SizedBox(
              width: 100.w,
              child: PrimaryButton(
                btnTitle: OK,
                onClick: () {
                  CustomNavigator.pop();
                  onSubmit(_yearList[_selectedYearIndex!].toString());
                },
                padding: 0,
              ),
            ),
          ],
        );
      });
}
