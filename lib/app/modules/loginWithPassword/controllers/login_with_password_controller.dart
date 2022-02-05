import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:readgear/app/core/constants/api_constants.dart';
import 'package:readgear/app/core/local_shared_data.dart';
import 'package:readgear/app/core/models/api_response_model.dart';
import 'package:readgear/app/core/models/failure_model.dart';
import 'package:readgear/app/core/models/user.dart';
import 'package:readgear/app/core/network_call/node_api_calls.dart';
import 'package:readgear/app/core/validation_functions.dart';
import 'package:readgear/app/modules/splash/controllers/splash_controller.dart';
import 'package:readgear/app/routes/app_pages.dart';
import 'package:readgear/app/routes/custom_navigator.dart';

class LoginWithPasswordController extends GetxController {
  final NodeApiCalls nodeApiCalls;
  LoginWithPasswordController({required this.nodeApiCalls});
  late TextEditingController emailPhoneController;
  late TextEditingController passwordController;
  late SplashController authController;
  late bool isPasswordVisible;

  @override
  void onInit() {
    authController = Get.find<SplashController>();
    emailPhoneController = TextEditingController();
    passwordController = TextEditingController();
    isPasswordVisible = true;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  onClickProceed() async {
    var body = ValidationFunctions.isEmail(emailPhoneController.text)
        ? {
            "email": emailPhoneController.text,
            "userPassword": passwordController.text
          }
        : {
            "mobileNumber": emailPhoneController.text,
            "userPassword": passwordController.text
          };
    String endpoint = ValidationFunctions.isEmail(emailPhoneController.text)
        ? LOGIN_WITH_EMAIL_PASSWORD_ENPOINT
        : LOGIN_WITH_MOBILE_PASSWORD_ENPOINT;

    Either<FailureModel, ApiResponseModel> response =
        await nodeApiCalls.postRequestWithoutAuth(
      endpoint,
      body,
    );

    response.fold((failure) {}, (apiResponse) async {
      if (apiResponse.status) {
        authController.user.value = User.fromJson(apiResponse.entity["user"]);
        await CustomSharePreferenceMethods.addKeyValue(
            "authToken", apiResponse.entity["token"]);
        authController.authToken.value = apiResponse.entity["token"];
        authController.user.value = User.fromJson(apiResponse.entity["user"]);
        await CustomSharePreferenceMethods.addKeyValue(
          "user",
          jsonEncode(apiResponse.entity),
        );

        CustomNavigator.pushTo(Routes.HOME);
      } else {}
    });
  }

  @override
  void onClose() {
    emailPhoneController.dispose();
    passwordController.dispose();
  }

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }
}
