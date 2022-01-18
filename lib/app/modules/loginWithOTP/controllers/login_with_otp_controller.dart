import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nirog_street/app/core/constants/api_constants.dart';
import 'package:nirog_street/app/core/constants/value_constants.dart';
import 'package:nirog_street/app/core/models/api_response_model.dart';
import 'package:nirog_street/app/core/models/failure_model.dart';
import 'package:nirog_street/app/core/network_call/node_api_calls.dart';
import 'package:nirog_street/app/core/validation_functions.dart';
import 'package:nirog_street/app/routes/app_pages.dart';
import 'package:nirog_street/app/routes/custom_navigator.dart';

class LoginWithOTPController extends GetxController {
  final NodeApiCalls nodeApiCalls;
  LoginWithOTPController({required this.nodeApiCalls});
  late TextEditingController emailPhoneController;

  late bool isPasswordVisible;

  @override
  void onInit() {
    emailPhoneController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  onClickGetOtp() async {
    var body = ValidationFunctions.isEmail(emailPhoneController.text)
        ? {"email": emailPhoneController.text}
        : {"mobileNumber": emailPhoneController.text, "country_code": "91"};
    String getOtpEndpoint =
        ValidationFunctions.isEmail(emailPhoneController.text)
            ? SEND_OTP_EMAIL_ENDPOINT
            : SEND_OTP_MOBILE_ENDPOINT;
    Either<FailureModel, ApiResponseModel> response =
        await nodeApiCalls.postRequestWithoutAuth(
      getOtpEndpoint,
      body,
    );

    response.fold((failure) {}, (apiResponse) async {
      if (apiResponse.status) {
        EasyLoading.dismiss();
        CustomNavigator.pushTo(Routes.VERIFICATION,
            arguments: VerificationPageType.ForLoggin);
      } else {}
    });
  }

  @override
  void onClose() {
    emailPhoneController.dispose();
  }
}
