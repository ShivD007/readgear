import 'package:get/get.dart';
import 'package:nirog_street/app/core/di/injection_container.dart';

import '../controllers/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationController>(
      () => VerificationController(nodeApiCalls: sl()),
    );
  }
}
