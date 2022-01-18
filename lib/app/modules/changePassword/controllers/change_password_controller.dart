import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nirog_street/app/core/constants/api_constants.dart';
import 'package:nirog_street/app/core/di/injection_container.dart';
import 'package:nirog_street/app/core/models/api_response_model.dart';
import 'package:nirog_street/app/core/models/failure_model.dart';
import 'package:nirog_street/app/core/network_call/node_api_calls.dart';
import 'package:nirog_street/app/core/validation_functions.dart';
import 'package:nirog_street/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:nirog_street/app/modules/loginWithPassword/controllers/login_with_password_controller.dart';
import 'package:nirog_street/app/routes/app_pages.dart';
import 'package:nirog_street/app/routes/custom_navigator.dart';

class ChangePasswordController extends GetxController {
  final NodeApiCalls nodeApiCalls;
  ChangePasswordController({required this.nodeApiCalls});
  late TextEditingController passwordController;
  late TextEditingController confPasswordController;
  late bool isPasswordVisible;

  @override
  void onInit() {
    confPasswordController = TextEditingController();
    passwordController = TextEditingController();
    isPasswordVisible = true;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  onClickSave() async {
    var controller = Get.find();

    var body = ValidationFunctions.isEmail(controller.emailPhoneController.text)
        ? {
            "email": controller.emailPhoneController.text,
            "password": passwordController.text
          }
        : {
            "mobileNumber": controller.emailPhoneController.text,
            "password": passwordController.text
          };
    String endpoint =
        ValidationFunctions.isEmail(controller.emailPhoneController.text)
            ? CHANGE_PASSWORD_EMAIL_ENDPOINT
            : CHANGE_PASSWORD_MOBILE_ENDPOINT;
    Either<FailureModel, ApiResponseModel> response =
        await nodeApiCalls.postRequestWithoutAuth(endpoint, body);
    response.fold((failure) {}, (apiResponse) async {
      if (apiResponse.status) {
        Get.put(LoginWithPasswordController(nodeApiCalls: sl()));
        CustomNavigator.pushReplacement(Routes.LOGIN_PASSWORD);
      } else {}
    });
  }

  @override
  void onClose() {
    confPasswordController.dispose();
    passwordController.dispose();
  }

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }
}
