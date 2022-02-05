import 'package:get/get.dart';
import 'package:readgear/app/core/di/injection_container.dart';

import '../controllers/create_account_controller.dart';

class CreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(
      () => CreateAccountController(nodeApiCalls: sl()),
    );
  }
}
