import 'package:get/get.dart';

import '../controllers/walk_through_controller.dart';

class WalkThroughBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalkThroughController>(
      () => WalkThroughController(),
    );
  }
}
