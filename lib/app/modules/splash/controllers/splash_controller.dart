import 'dart:convert';

import 'package:get/get.dart';
import 'package:readgear/app/core/local_shared_data.dart';
import 'package:readgear/app/core/models/user.dart';
import '../../../core/user_info.dart';
import '/app/routes/app_pages.dart';
import '/app/routes/custom_navigator.dart';

class SplashController extends GetxController {
  Rx<User> user = User.fromJson({
    "id": 103537,
    "title": "1",
    "fullName": "Unknown",
    "userType": 1,
    "mobileNumber": "",
    "email": "",
    "pincode": 0
  }).obs;

  late Rx<String> authToken = "".obs;

  CustomSharePreferenceMethods customSharePreferenceMethods =
      CustomSharePreferenceMethods();
  Worker? _worker1, _worker2;
  @override
  void onInit() {
    super.onInit();
    _worker1 = ever(user, (User? value) {
      // userInfo = value!;
    });
    _worker2 = ever(authToken, (String? value) {
      // authTokenInfo = value!;
    });
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    _worker2?.dispose();
    _worker1?.dispose();
  }

  Future<void> setSplashTimer() async {
    int nSplashTimer = 2;
    authToken.value =
        await CustomSharePreferenceMethods.getValueFromKey("authToken");
    if (authToken.isEmpty) {
      await Future.delayed(Duration(seconds: nSplashTimer)).then((value) {
        CustomNavigator.pushReplacement(Routes.WALKTHROUGH);
      });
    } else {
      String localUserData =
          await CustomSharePreferenceMethods.getValueFromKey("user");
      print(localUserData.toString());
      print(localUserData.runtimeType);

      user.value = User.fromJson(jsonDecode(localUserData)["user"]);
      print(user.value);
      print(user.value.toJson().toString());
      print(authToken.value);
      CustomNavigator.pushTo(Routes.HOME);
    }

    print('Splash for few seconds !!!');
  }
}
