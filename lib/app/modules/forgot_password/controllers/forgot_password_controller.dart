import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:readgear/app/core/constants/api_constants.dart';
import 'package:readgear/app/core/constants/value_constants.dart';
import 'package:readgear/app/core/models/api_response_model.dart';
import 'package:readgear/app/core/models/failure_model.dart';
import 'package:readgear/app/core/network_call/node_api_calls.dart';
import 'package:readgear/app/core/validation_functions.dart';
import 'package:readgear/app/routes/app_pages.dart';
import 'package:readgear/app/routes/custom_navigator.dart';

class ForgotPasswordController extends GetxController {
  final NodeApiCalls nodeApiCalls;
  ForgotPasswordController({required this.nodeApiCalls});
  late TextEditingController emailPhoneController;
  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    emailPhoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  onClickGetOtp() async {
    if (formKey.currentState!.validate()) {
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
          CustomNavigator.pushTo(Routes.VERIFICATION,
              arguments: VerificationPageType.ForChangePassword);
        } else {}
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailPhoneController.dispose();
  }
}
