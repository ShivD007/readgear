// All values used inside the app
//==========================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readgear/app/core/constants/string_constants.dart';
import 'package:readgear/app/core/local_shared_data.dart';
import 'package:readgear/app/routes/app_pages.dart';
import 'package:readgear/app/routes/custom_navigator.dart';

import '/app/core/constants/image_constants.dart';

const double VALUE_ACTION_PRIMARY_BUTTON_WIDTH = 312;
const double VALUE_ACTION_PRIMARY_BUTTON_HEIGHT = 48;

const ACCESS_KEY_ID = 'AKIAVC4OA5T3VWAVEYWQ';
const SECRET_KEY_ID = 'yej6Em3UwP5yAf0nkRe2UWxWXpjvtYSyt+2Fw4AT';
const REGION = 'ap-south-1';
const S3ENDPOINT = 'https://nirogdev.s3.ap-south-1.amazonaws.com/';
const BUCKET_NAME = 'nirogdev';

List daysOfTheWeek = ["Mon", "Tues", "Wed", "Thur", "Fri", "Sat", "Sun"];
List monthsOfTheYear = [
  "Jan",
  "Feb",
  "Mar",
  "April",
  "May",
  "June",
  "Jul",
  "Aug",
  "Sept",
  "Oct",
  "Nov",
  "Dec"
];

final List<Map<String, dynamic>> WALKTHROUGH_CAROUSEL_LIST = [
  {
    "headingText": SAFE_RIDE,
    "imagePath": ONBOARDING_1,
  },
  {
    "headingText": CONNECT_DOCTOR,
    "imagePath": ONBOARDING_2,
  },
  {
    "headingText": SAVING_EFFECTIVE,
    "imagePath": ONBOARDING_3,
  },
];

//==========================================================
// Enums
enum AvartarShapes {
  None,
  Standard, // Corners will not be sharp
  Circular, // Circular
  Square, // Sharp corners
  Profile, // To show passwd alphabet
  File // From a file path
}
enum TextStyleType { H25, Subtitle20, Overline16, Body, Caption }

enum VerificationPageType {
  None,
  ForChangePassword,
  ForLoggin,
  ForCreateAccount
}

enum ImageShapes {
  None,
  Standard, // Corners will not be sharp
  Square, // Sharp corners
}
enum ProfileType {
  None,
  Doctor,
  Student,
  Chemist,
}

//==========================================================
// Corner radius
double VALUE_STANDARD_BUTTON_CORNER_RADIUS = 24.r;
double SEARCHBAR_CORNER_RADIUS = 40.r;
double VALUE_AVATAR_ICON_CORNER_RADIUS = 20.r;
double HEADER_CARD_BORDER_RADIUS = 12.r;
const double VALUE_TABBAR_BORDER_RADIUS = 0;
double VALUE_ICONTITLESUBTITLE_BORDER_RADIUS = 10.r;
double VALUE_INPUT_BORDER_RADIUS = 8.0.r;
double SMALL_BORDER_RADIUS = 4.0.r;
//==========================================================
// Elevations
const double HEADER_CARD_ELEVATION = 0.0;
//==========================================================
// Height
double VALUE_TAB_BAR_HEIGHT = kToolbarHeight;
double OPENED_DROPDOWN_ITEM_PADDING = 12.0.h;
//==========================================================
// Width
const double VALUE_TAB_BAR_LINE_WIDTH = 3;
//==========================================================
const String CURRENCY = "₹";
// box-shadow
BOXSHADOW(
        {double? dx,
        double? dy,
        double? sRadius,
        double? bRadius,
        Color? color}) =>
    BoxShadow(
        offset: Offset(dx ?? 0, dy ?? 6),
        blurRadius: bRadius ?? 8,
        spreadRadius: sRadius ?? 0.0,
        color: color ?? const Color.fromRGBO(0, 0, 0, 0.1));
