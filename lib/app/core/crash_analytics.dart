import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FirebaseCrashAnalyticsMethods {
  static Future<void> reportError(exception, stackTrace) async {
    if (kDebugMode) {
      print("reporting error in debug mode ====>");
      print(exception.toString());
      print(stackTrace.toString());
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    }
  }
}
