import 'dart:async';
import 'dart:isolate';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readgear/app/core/crash_analytics.dart';
import 'package:readgear/app/core/di/injection_container.dart' as di;
import 'app_launch.dart';
import 'flavors.dart';

void main() async {
  await di.init();
  // runZonedGuarded<Future<void>>(() async {
  //   WidgetsFlutterBinding.ensureInitialized();

  //   SystemChrome.setPreferredOrientations(
  //       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //   await Firebase.initializeApp();
  //   FlutterError.onError = (FlutterErrorDetails flutterErrorDetails) async {
  //     await FirebaseCrashAnalyticsMethods.reportError(
  //         flutterErrorDetails.exception, flutterErrorDetails.stack);
  //   };
  // }, (error, stack) => FirebaseCrashAnalyticsMethods.reportError(error, stack));

  // Isolate.current.addErrorListener(RawReceivePort((pair) async {
  //   final List<dynamic> errorAndStacktrace = pair;
  //   await FirebaseCrashAnalyticsMethods.reportError(
  //       errorAndStacktrace.first, errorAndStacktrace.last);
  // }).sendPort);

  FlavorTypes.appFlavor = Flavor.QA;
  runApp(AppLaunch());
}
