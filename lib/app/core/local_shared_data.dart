import 'package:readgear/app/core/crash_analytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomSharePreferenceMethods {
  static addKeyValue(String key, value) async {
    try {
      print("addkey value");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var added = await prefs.setString(key, value);
      return added;
    } catch (error, stackTrace) {
      return false;
    }
  }

  static deleteKeyValue(String key) async {
    print("deletekey value");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } catch (error, stackTrace) {
      return false;
    }
  }

  static getValueFromKey(String key) async {
    print("get key value");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var value = prefs.get(key) ?? "";
      return value;
    } catch (error, stackTrace) {
      return "";
    }
  }
}
