// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/app/core/constants/style_constants.dart';
import '/app/core/app_colors.dart';
import '/app/core/constants/value_constants.dart';

class CustomTabBar extends StatelessWidget {
  final List<Tab> tabs;
  final double borderRadiusBase;
  final Color colorBase;
  final Color colorHighlight;
  final Color colorSelectedLabel;
  final Color colorUnselectedLabel;
  final bool bUnderline;
  final double dLineWidth;
  final void Function(int) onTabClick;
  final TabController? tabController;

  CustomTabBar({
    required this.tabs,
    required this.onTabClick,
    this.borderRadiusBase = VALUE_TABBAR_BORDER_RADIUS,
    this.colorBase = Colors.transparent,
    this.colorHighlight = Colors.transparent,
    this.colorSelectedLabel = AppColors.COLOR_WHITE,
    this.colorUnselectedLabel = AppColors.COLOR_GREY_900,
    this.bUnderline = false,
    this.dLineWidth = VALUE_TAB_BAR_LINE_WIDTH,
    Key? key,
    this.tabController,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: VALUE_TAB_BAR_HEIGHT.h,
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            borderRadiusBase,
          ),
          color: colorBase),
      child: TabBar(
        onTap: (nTabIndex) {
          onTabClick(nTabIndex);
        },
        controller: tabController,
        tabs: tabs,
        labelStyle: Style_OpenSans.overlineSemiboldGrey500_16px,
        labelColor: colorSelectedLabel,
        unselectedLabelStyle: Style_OpenSans.overlineSemiboldGrey500_16px,
        unselectedLabelColor: colorUnselectedLabel,
        indicator: bUnderline == false
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadiusBase),
                color: colorHighlight,
              )
            : UnderlineTabIndicator(
                borderSide:
                    BorderSide(color: colorHighlight, width: dLineWidth),
                //insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
              ),
      ),
    );
  }
}
