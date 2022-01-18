import 'package:get/get.dart';
import 'package:nirog_street/app/core/di/injection_container.dart';

import '../controllers/create_account_controller.dart';

class CreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(
      () => CreateAccountController(nodeApiCalls: sl()),
    );
  }
}
