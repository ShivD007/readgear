import 'package:get/get.dart';
import 'package:readgear/app/core/di/injection_container.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(nodeApiCalls: sl()),
    );
  }
}
