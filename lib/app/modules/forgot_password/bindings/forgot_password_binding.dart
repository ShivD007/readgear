import 'package:get/get.dart';
import 'package:readgear/app/core/di/injection_container.dart';
import 'package:readgear/app/modules/forgot_password/controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(nodeApiCalls: sl()),
    );
  }
}
