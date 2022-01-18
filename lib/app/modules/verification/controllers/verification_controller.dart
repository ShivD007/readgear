import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirog_street/app/atoms/buttons/button_core.dart';
import 'package:nirog_street/app/atoms/custom_dialog.dart';
import 'package:nirog_street/app/core/constants/api_constants.dart';
import 'package:nirog_street/app/core/constants/country_constants.dart';
import 'package:nirog_street/app/core/constants/value_constants.dart';
import 'package:nirog_street/app/core/local_shared_data.dart';
import 'package:nirog_street/app/core/models/api_response_model.dart';
import 'package:nirog_street/app/core/models/failure_model.dart';
import 'package:nirog_street/app/core/models/user.dart';
import 'package:nirog_street/app/core/network_call/node_api_calls.dart';
import 'package:nirog_street/app/core/validation_functions.dart';
import 'package:nirog_street/app/modules/createAccount/controllers/create_account_controller.dart';
import 'package:nirog_street/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:nirog_street/app/modules/loginWithOTP/controllers/login_with_otp_controller.dart';
import 'package:nirog_street/app/modules/splash/controllers/splash_controller.dart';
import 'package:nirog_street/app/routes/app_pages.dart';
import 'package:nirog_street/app/routes/custom_navigator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationController extends GetxController {
  final NodeApiCalls nodeApiCalls;
  VerificationController({required this.nodeApiCalls});
  late TextEditingController text = TextEditingController();

  final StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  late final bool hasError = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late final bool visibilityTag = false;
  late final TextEditingController textEditingController =
      TextEditingController();
  //pin digits variables and setters
  late String currentText = "";
  late RxString errorText = "".obs;

  // Image uploads
  var selectedImagePath = "".obs;

  set errorTextChange(String errorTextChange) {
    errorText.value = errorTextChange;
  }

  set hasError(bool hasError) {
    if (hasError == true) {
      hasError = false;
    } else {
      hasError = true;
    }
  }

  //Intl text field variables
  RxMap<String, dynamic> chosenValue = countries[0].obs;
  RxBool errorWithNumber = false.obs;
  set countryDropDown(Map<String, dynamic> value) {
    chosenValue.value = value;
  }

  set numberError(bool error) {
    errorWithNumber.value = error;
  }

  //for shimmer effect
  RxBool enabled = true.obs;

  set enabledChange(bool enabledChange) {
    enabled.value = !enabled.value;
  }

  // Switch variables and setters
  late RxBool switchValueOne = true.obs;
  late RxBool switchValueTwo = false.obs;
  late RxBool switchValueThree = false.obs;

  set switchValueOneChange(bool switchValueOneChange) {
    switchValueOne.value = !switchValueOne.value;
  }

  set switchValueTwoChange(bool switchValueTwoChange) {
    switchValueTwo.value = !switchValueTwo.value;
  }

  //File Upload
  late FilePickerResult? file;
  late RxBool filePicked = false.obs;
  late var filePath;

  Future openFileExplorer() async {
    file = (await FilePicker.platform.pickFiles(
      type: FileType.custom,
      //here you can add any of extention what you need to pick
      allowedExtensions: [
        'pdf',
        'jpg',
        'xlsx',
      ],
    ))!;

    // if (file != null) {
    //   print(file.files.first.path);
    //   print(file.files.first.size);
    //   print(file.files.first.name);
    //   print(file.files.first.extension);
    // }
    filePicked.value = true;
    filePath = File(file!.files.single.path ?? "");

    return file;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  verifyOtp(VerificationPageType verificationPageType) async {
    var authController = Get.put(SplashController());
    var dataToSend;
    var otpController;
    String endPoint;
    if (verificationPageType == VerificationPageType.ForCreateAccount) {
      otpController = Get.find<CreateAccountController>();
      dataToSend = {
        "otp": 1234,
        "mobileNumber": otpController.mobileEditingController.text,
        "country_code": "91",
        "userData": {
          "userType": otpController.selectedProfession!.id,
          "full_name": otpController.nameEditingController.text,
          "email": otpController.emailEditingController.text,
          "pincode": int.parse(otpController.pinCodeEditingController.text),
          "userPassword": otpController.pwdEditingController.text,
          "title": otpController.selectedTitle!.id,
        }
      };
      // print(dataToSend);
      endPoint = VERIFY_REGISTERATION_ENDPOINT;
    } else {
      if (verificationPageType == VerificationPageType.ForLoggin) {
        otpController = Get.find<LoginWithOTPController>();
        dataToSend =
            ValidationFunctions.isEmail(otpController.emailPhoneController.text)
                ? {
                    "email": otpController.emailPhoneController.text,
                    "otp": int.parse(textEditingController.text),
                    "country_code": "91"
                  }
                : {
                    "mobileNumber": otpController.emailPhoneController.text,
                    "otp": int.parse(textEditingController.text),
                    "country_code": "91"
                  };
        endPoint =
            ValidationFunctions.isEmail(otpController.emailPhoneController.text)
                ? LOGIN_WITH_EMAIL_OTP_ENPOINT
                : LOGIN_WITH_MOBILE_OTP_ENPOINT;
      } else if (verificationPageType ==
          VerificationPageType.ForChangePassword) {
        otpController = Get.find<ForgotPasswordController>();
        dataToSend =
            ValidationFunctions.isEmail(otpController.emailPhoneController.text)
                ? {
                    "email": otpController.emailPhoneController.text,
                    "otp": int.parse(textEditingController.text),
                  }
                : {
                    "mobileNumber": otpController.emailPhoneController.text,
                    "otp": int.parse(textEditingController.text),
                  };
        endPoint =
            ValidationFunctions.isEmail(otpController.emailPhoneController.text)
                ? VERIFY_OTP_EMAIL_ENDPOINT
                : VERIFY_OTP_MOBILE_ENDPOINT;
      } else {
        endPoint = "";
      }
    }
    Either<FailureModel, ApiResponseModel> response =
        await nodeApiCalls.postRequestWithoutAuth(
      endPoint,
      dataToSend,
    );
    response.fold((failure) {}, (apiResponse) async {
      if (apiResponse.status) {
        if (verificationPageType == VerificationPageType.ForChangePassword) {
          CustomNavigator.pushReplacement(Routes.CHANGE_PASWORD);
        } else {
          await CustomSharePreferenceMethods.addKeyValue(
              "authToken", apiResponse.entity["token"]);
          authController.authToken.value = apiResponse.entity["token"];
          authController.user.value = User.fromJson(apiResponse.entity["user"]);
          await CustomSharePreferenceMethods.addKeyValue(
            "user",
            jsonEncode(apiResponse.entity),
          );
          CustomNavigator.pushTo(Routes.HOME);
        }
      } else {}
    });
  }

  onClickResendOtp(VerificationPageType verificationPageType) async {
    var dataToSend;
    var otpController;
    String endPoint;

    if (verificationPageType == VerificationPageType.ForCreateAccount) {
      otpController = Get.find<CreateAccountController>();
      dataToSend =
          ValidationFunctions.isEmail(otpController.emailPhoneController.text)
              ? {
                  "email": otpController.emailPhoneController.text,
                  "country_code": "91"
                }
              : {
                  "mobileNumber": otpController.emailPhoneController.text,
                  "country_code": "91"
                };
      endPoint =
          ValidationFunctions.isEmail(otpController.emailPhoneController.text)
              ? SEND_OTP_EMAIL_ENDPOINT
              : SEND_OTP_MOBILE_ENDPOINT;
    } else {
      if (verificationPageType == VerificationPageType.ForLoggin) {
        otpController = Get.find<LoginWithOTPController>();
        dataToSend =
            ValidationFunctions.isEmail(otpController.emailPhoneController.text)
                ? {
                    "email": otpController.emailPhoneController.text,
                    "country_code": "91"
                  }
                : {
                    "mobileNumber": otpController.emailPhoneController.text,
                    "country_code": "91"
                  };
        endPoint =
            ValidationFunctions.isEmail(otpController.emailPhoneController.text)
                ? SEND_OTP_EMAIL_ENDPOINT
                : SEND_OTP_MOBILE_ENDPOINT;
      } else if (verificationPageType ==
          VerificationPageType.ForChangePassword) {
        otpController = Get.find<ForgotPasswordController>();
        dataToSend =
            ValidationFunctions.isEmail(otpController.emailPhoneController.text)
                ? {
                    "email": otpController.emailPhoneController.text,
                    "country_code": "91"
                  }
                : {
                    "mobileNumber": otpController.emailPhoneController.text,
                    "country_code": "91"
                  };
        endPoint =
            ValidationFunctions.isEmail(otpController.emailPhoneController.text)
                ? SEND_OTP_EMAIL_ENDPOINT
                : SEND_OTP_MOBILE_ENDPOINT;
      } else {
        endPoint = "";
      }
    }

    Either<FailureModel, ApiResponseModel> response =
        await nodeApiCalls.postRequestWithoutAuth(
      endPoint,
      dataToSend,
    );

    response.fold((failure) {}, (apiResponse) async {
      if (apiResponse.status) {
        // showToast("Otp Sent Successfully");
      } else {}
    });
  }

  void currentTextChange(String value) {
    currentText = value;
  }

  // This is to pick the image from a source, can be gallery, camera etc
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('error', 'No image selected');
    }
  }
}
