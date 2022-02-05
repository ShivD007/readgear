import 'package:get/get.dart';
import 'package:readgear/app/core/di/injection_container.dart';

import '../controllers/login_with_otp_controller.dart';

class LoginWithOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginWithOTPController>(
      () => LoginWithOTPController(nodeApiCalls: sl()),
    );
  }
}
