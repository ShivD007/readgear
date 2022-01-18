// Standard buttons
//==========================================================
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class Style {
  static const TextStyle textStyleButtonBlue = TextStyle(
      fontSize: 16,
      color: AppColors.COLOR_WHITE,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);
  static const TextStyle textStyleButtonWhite = TextStyle(
      fontSize: 16,
      color: AppColors.COLOR_BLUE_500,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);
  static const TextStyle textStyleButtonGrey = TextStyle(
      fontSize: 16,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);
  static const TextStyle textStyleSubheading20 = TextStyle(
    fontSize: 16,
    color: AppColors.COLOR_GREY_500,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
  static const TextStyle textStyleDrawerItem = TextStyle(
      fontSize: 16,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal);
  static const TextStyle textStyleChipGreen = TextStyle(
      fontSize: 16,
      color: AppColors.COLOR_GREEN_900,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);
  static const TextStyle styleHeaderCardHeading = TextStyle(
      fontSize: 25,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
      fontStyle: FontStyle.normal);
  static const TextStyle styleHeaderCardHeadingMontserrat = TextStyle(
      fontSize: 25,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w600,
      fontFamily: "Montserrat",
      letterSpacing: -0.2,
      fontStyle: FontStyle.normal);
  static const TextStyle styleHeaderLoginHeadingMontserrat = TextStyle(
      fontSize: 20,
      color: AppColors.COLOR_BLUE_500,
      fontWeight: FontWeight.w600,
      fontFamily: "Montserrat",
      fontStyle: FontStyle.normal);
  static const TextStyle styleHeaderDialogContent = TextStyle(
      fontSize: 14,
      color: AppColors.COLOR_GREY_500,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal);
  static const TextStyle styleLabelText = TextStyle(
      fontSize: 14,
      color: AppColors.COLOR_GREY_400,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);
  static const TextStyle styleHeaderCardSubHeading = TextStyle(
      fontSize: 12,
      color: AppColors.COLOR_GREY_500,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);
  static const TextStyle styleHeaderCardBlueSubHeading = TextStyle(
      fontSize: 12,
      color: AppColors.COLOR_BLUE_500,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);
  static const TextStyle styleForgotPassBlue = TextStyle(
      fontSize: 14,
      color: AppColors.COLOR_BLUE_500,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal);
  static const TextStyle styleTabItem = TextStyle(
      fontSize: 14, color: AppColors.COLOR_WHITE, fontWeight: FontWeight.bold);
}

class Style_SFProTextRegular {
  static const strFontFamily = "SF-Pro-Text-Regular";

  static const TextStyle stylePrimaryText = TextStyle(
      fontSize: 16,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.5,
      height: 1.5);

  static const styleForiconTextTitle = TextStyle(
      fontSize: 14,
      color: AppColors.COLOR_GREY_600,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.5,
      height: 1.5);

  static const styleForblack_1A1A1A_400w14 = TextStyle(
      fontSize: 14,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.7,
      height: 1.5);

  static const styleForblack_1A1A1A_400w16 = TextStyle(
      fontSize: 16,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.5,
      height: 1);

  static const styleForblack_1A1A1A_400w12 = TextStyle(
      fontSize: 12,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.4,
      height: 1.5);

  static const styleForgrey_66666_400w12 = TextStyle(
      fontSize: 12,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.4,
      height: 2);

  static const styleForgrey_66666_500w10 = TextStyle(
      fontSize: 10,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.4,
      height: 1);
}

class Style_OpenSansMedium {
  static const strFontFamily = "OpenSansMedium";

  static TextStyle styleSecondaryButtonGrey_26273D = TextStyle(
    fontSize: 16.sp,
    color: AppColors.COLOR_GREY_900,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontFamily: strFontFamily,
  );
  static TextStyle captionSemiboldGrey900_12px_600 = TextStyle(
    fontSize: 12.sp,
    color: AppColors.COLOR_GREY_900,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontFamily: strFontFamily,
  );

  static TextStyle bodyRegularGrey900_14px_600 = TextStyle(
      fontSize: 14.sp,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);

  static TextStyle styleLabelText = TextStyle(
    fontSize: 16.sp,
    color: AppColors.COLOR_GREY_900,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: strFontFamily,
  );
  static TextStyle styleLabelText16_600 = TextStyle(
    fontSize: 16.sp,
    color: AppColors.COLOR_GREY_900,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontFamily: strFontFamily,
  );
}

class Style_OpenSansLight {
  static const strFontFamily = "OpenSansLight";

  static TextStyle styleSecondaryButtonGrey_26273D = TextStyle(
    fontSize: 16.sp,
    color: AppColors.COLOR_GREY_900,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontFamily: strFontFamily,
  );

  static TextStyle bodyRegularGrey500_10px = TextStyle(
      fontSize: 10.sp,
      color: AppColors.COLOR_GREY_500,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);
}

class Style_OpenSansBold {
  static const strFontFamily = "OpenSansBold";
  static TextStyle label12 = TextStyle(
    fontSize: 12.sp,
    color: AppColors.COLOR_RED,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    fontFamily: strFontFamily,
  );
}

class Style_OpenSans {
  static const strFontFamily = "OpenSansRegular";

  static TextStyle styleBlack_1A1A1A = TextStyle(
    fontSize: 16.sp,
    color: AppColors.COLOR_GREY_900,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontFamily: strFontFamily,
    letterSpacing: 0.2,
  );

  static TextStyle styleHeader = TextStyle(
      fontSize: 14.sp,
      color: AppColors.COLOR_GREY_500,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.5,
      fontStyle: FontStyle.normal);

  static TextStyle styleBlack20 = TextStyle(
    fontSize: 20.sp,
    color: AppColors.COLOR_GREY_900,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontFamily: strFontFamily,
    letterSpacing: 0.2,
  );
  static TextStyle styleWhite20 = TextStyle(
    fontSize: 20.sp,
    color: AppColors.COLOR_WHITE,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: strFontFamily,
    letterSpacing: 0.2,
  );

  static TextStyle generalStyle(
          {FontWeight fontWeight = FontWeight.normal,
          Color textColor = AppColors.COLOR_BLACK,
          double fontSize = 16,
          FontStyle fontStyle = FontStyle.normal,
          TextDecoration decoration = TextDecoration.none}) =>
      TextStyle(
        fontSize: fontSize.sp,
        color: textColor,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        fontFamily: strFontFamily,
        letterSpacing: 0.2,
      );

  static TextStyle styleWhite(double fontSize) {
    return TextStyle(
      fontSize: 20.sp,
      color: AppColors.COLOR_WHITE,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2,
    );
  }

  static TextStyle style16BOLD600(Color textColor) => TextStyle(
        fontSize: 16.sp,
        color: textColor,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: strFontFamily,
        letterSpacing: 0.2,
      );

  static TextStyle style12Normal(Color textColor) => TextStyle(
        fontSize: 12.sp,
        color: textColor,
        fontStyle: FontStyle.normal,
        fontFamily: strFontFamily,
        letterSpacing: 0.2,
      );

  static TextStyle style14Normal(Color textColor) => TextStyle(
        fontSize: 12.sp,
        color: textColor,
        fontStyle: FontStyle.normal,
        fontFamily: strFontFamily,
        letterSpacing: 0.2,
      );

  static TextStyle style16BOLD(Color textColor) => TextStyle(
        fontSize: 16.sp,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontFamily: strFontFamily,
        letterSpacing: 0.2,
      );
  static TextStyle style10BOLD(Color textColor) => TextStyle(
        fontSize: 10.sp,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontFamily: strFontFamily,
        letterSpacing: 0.2,
      );

  static  TextStyle style14BOLD600(Color textColor) => TextStyle(
        fontSize: 14.sp,
        color: textColor,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: strFontFamily,
        letterSpacing: 0.2,
      );

  static TextStyle styleWhite12 = TextStyle(
    fontSize: 12.sp,
    color: AppColors.COLOR_WHITE,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontFamily: strFontFamily,
    letterSpacing: 0.2,
  );

  static styleButton({
    fontSize,
    color = AppColors.COLOR_BLUE_500,
    fontWeight = FontWeight.w400,
    fontStyle = FontStyle.normal,
    fontFamily = strFontFamily,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 20.h,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        letterSpacing: 0.2,
      );

  static TextStyle styleBlue20 = TextStyle(
    fontSize: 20.sp,
    color: AppColors.COLOR_BLUE_500,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: strFontFamily,
    letterSpacing: 0.2,
  );
  static TextStyle styleBlue16 = TextStyle(
    fontSize: 16.sp,
    color: AppColors.COLOR_BLUE_500,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontFamily: strFontFamily,
    letterSpacing: 0.2,
  );

  static TextStyle overlineSemiboldGrey500_16px = TextStyle(
      fontSize: 16.sp,
      color: AppColors.COLOR_GREY_500,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);

  static TextStyle bodyRegularGrey400_16px = TextStyle(
      fontSize: 16.sp,
      color: AppColors.COLOR_GREY_400,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);

  static TextStyle bodySemiBoldGrey900_14px = TextStyle(
      fontSize: 14.sp,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);

  static TextStyle bodySemiBoldGrey900_16px = TextStyle(
      fontSize: 16.sp,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);

  static TextStyle bodyRegularGrey900_16px = TextStyle(
      fontSize: 16.sp,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);

  static TextStyle subtitleSemiboldGrey600_20px = TextStyle(
      fontSize: 20.sp,
      color: AppColors.COLOR_GREY_600,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);
  static TextStyle captionSemiboldGrey900_12px = TextStyle(
      fontSize: 12.sp,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);

  static TextStyle labelRegularGrey400_12px = TextStyle(
      fontSize: 12.sp,
      color: AppColors.COLOR_GREY_400,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);
  static TextStyle labelRegularGrey400_14px = TextStyle(
      fontSize: 14.sp,
      color: AppColors.COLOR_GREY_400,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);
  static TextStyle labelSemiBoldGrey600_10px = TextStyle(
      fontSize: 10.sp,
      color: AppColors.COLOR_GREY_600,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);
}

class MontserratStyle {
  MontserratStyle._();

  static const strFontFamily = "Montserrat";

  static TextStyle h3SemiboldGrey900_25px = TextStyle(
      fontSize: 25.sp,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);
}

class Styles_Lato {
  Styles_Lato._();

  static const strFontFamily = "Lato";

  static TextStyle latoRegularGrey800_14px = TextStyle(
      fontSize: 14.sp,
      color: AppColors.COLOR_GREY_800,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);
  static TextStyle latoRegularBlue500_16px = TextStyle(
      fontSize: 16.sp,
      color: AppColors.COLOR_BLUE_500,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);
}

class Style_Inter {
  Style_Inter._();

  static const strFontFamily = "Inter";

  static TextStyle interSemibold_14px([Color? textColor]) => TextStyle(
      fontSize: 14.sp,
      color: textColor ?? AppColors.COLOR_GREY_500,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);

  static TextStyle interRegular_14px([Color? textColor]) => TextStyle(
      fontSize: 14.sp,
      color: textColor ?? AppColors.COLOR_GREY_600,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);
}
