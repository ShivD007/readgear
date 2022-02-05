import 'package:get/get.dart';
import 'package:readgear/app/core/di/injection_container.dart';

import '../controllers/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationController>(
      () => VerificationController(nodeApiCalls: sl()),
    );
  }
}
