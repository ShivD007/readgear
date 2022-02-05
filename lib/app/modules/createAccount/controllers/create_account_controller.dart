import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:readgear/app/core/constants/api_constants.dart';
import 'package:readgear/app/core/constants/value_constants.dart';
import 'package:readgear/app/core/models/api_response_model.dart';
import 'package:readgear/app/core/models/failure_model.dart';
import 'package:readgear/app/core/models/list_item_model.dart';
import 'package:readgear/app/core/network_call/node_api_calls.dart';
import 'package:readgear/app/routes/app_pages.dart';
import 'package:readgear/app/routes/custom_navigator.dart';

class CreateAccountController extends GetxController {
  final NodeApiCalls nodeApiCalls;
  CreateAccountController({required this.nodeApiCalls});
  late TextEditingController nameEditingController;
  late TextEditingController mobileEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController pinCodeEditingController;
  late TextEditingController referralCodeEditingController;
  late TextEditingController pwdEditingController;
  late TextEditingController conPwdEditingController;
  ListItemModel? selectedProfession;
  ListItemModel? selectedTitle;

  onClickGetOtp() async {
    var body = {
      "mobileNumber": mobileEditingController.text,
      "email": emailEditingController.text,
      "country_code": "91"
    };

    Either<FailureModel, ApiResponseModel> response =
        await nodeApiCalls.postRequestWithoutAuth(
      SEND_OTP_TO_REGISTER_ENDPOINT,
      body,
    );

    response.fold((failure) {}, (apiResponse) async {
      if (apiResponse.status) {
        EasyLoading.dismiss();
        CustomNavigator.pushTo(Routes.VERIFICATION,
            arguments: VerificationPageType.ForCreateAccount);
      } else {}
    });
  }

  @override
  void onInit() {
    nameEditingController = TextEditingController();
    mobileEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    pinCodeEditingController = TextEditingController();
    referralCodeEditingController = TextEditingController();
    pwdEditingController = TextEditingController();
    conPwdEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameEditingController.dispose();
    mobileEditingController.dispose();
    emailEditingController.dispose();
    pinCodeEditingController.dispose();
    referralCodeEditingController.dispose();
    pwdEditingController.dispose();
    conPwdEditingController.dispose();
  }
}
