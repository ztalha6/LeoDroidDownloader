import 'package:get/get.dart';

import '../controllers/codes_controller.dart';

class CodesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodesController>(
      () => CodesController(),
    );
  }
}
