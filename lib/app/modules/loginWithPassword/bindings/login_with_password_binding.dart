import 'package:get/get.dart';
import 'package:readgear/app/core/di/injection_container.dart';

import '../controllers/login_with_password_controller.dart';

class LoginWithPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginWithPasswordController>(
      () => LoginWithPasswordController(nodeApiCalls: sl()),
    );
  }
}
