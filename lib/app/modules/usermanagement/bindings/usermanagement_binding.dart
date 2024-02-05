import 'package:get/get.dart';

import '../controllers/usermanagement_controller.dart';

class UsermanagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsermanagementController>(
      () => UsermanagementController(),
    );
  }
}
