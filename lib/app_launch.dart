import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'app/core/app_themes.dart';
import 'flavors.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLaunch extends StatelessWidget {
  const AppLaunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize: const Size(414, 896),
          builder: () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: FlavorTypes.appTitle,
            translationsKeys: AppTranslation.translations,
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en', 'US'),
            enableLog: true,
            themeMode: ThemeMode.system,
            theme: AppThemes.ligtTheme,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            builder: (context, child) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}
