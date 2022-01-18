import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_launch.dart';
import 'flavors.dart';

void main() {
  FlavorTypes.appFlavor = Flavor.QA;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(AppLaunch());
}
