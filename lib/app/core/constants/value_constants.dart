// All values used inside the app
//==========================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirog_street/app/core/constants/string_constants.dart';
import 'package:nirog_street/app/core/local_shared_data.dart';
import 'package:nirog_street/app/routes/app_pages.dart';
import 'package:nirog_street/app/routes/custom_navigator.dart';

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

Map activitiesMap = {
  "Buy Medicines": {
    "assetPath": BUY_MEDICINES_ICON,
    "onClick": () {},
  },
  "View \nWebinar": {
    "assetPath": WEBINAR_ICON,
    "onClick": () {},
  },
  "Learn about \nAyurveda": {
    "assetPath": AYURVEDA_ICON,
    "onClick": () {},
  },
  "View All \nQuiz": {
    "assetPath": QUIZ_ICON,
    "onClick": () {},
  },
  "My Orders": {
    "assetPath": MY_ORDERS_ICON,
    "onClick": () {},
  },
  "Communities": {
    "assetPath": COMUNITY_ICON,
    "onClick": () {},
  },
};

// list and other constant datastructures
List<Map> DRAWER_ITEMS = [
  {
    "icon": PROFILE_ICON,
    "text": "My Profile",
    "callback": () {
      print("youoo");
    },
  },
  {
    "icon": CART_ICON,
    "text": "My Orders",
    "callback": () {},
  },
  {
    "icon": BOOKMARK_ICON,
    "text": "Bookmarks",
    "callback": () {},
  },
  {
    "icon": HEART_ICON,
    "text": "Saved Medicines",
    "callback": () {},
  },
  {
    "icon": NIROG_MONEY_ICON,
    "text": "Nirog Money",
    "callback": () {},
  },
  {
    "icon": NIROG_MONEY_ICON,
    "text": "My Address",
  },
  {
    "icon": FEED_ICON,
    "text": "Logout",
    "callback": () async {
      await CustomSharePreferenceMethods.deleteKeyValue('authToken');
      CustomNavigator.pushAndPopAll(Routes.WALKTHROUGH);
    },
  },
];

final List<Map<String, dynamic>> WALKTHROUGH_CAROUSEL_LIST = [
  {
    "headingText": BUY_MEDICINE,
    "imagePath": ONBOARDING_1,
  },
  {
    "headingText": CONNECT_DOCTOR,
    "imagePath": ONBOARDING_2,
  },
  {
    "headingText": LEARN_AYURVEDA,
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
