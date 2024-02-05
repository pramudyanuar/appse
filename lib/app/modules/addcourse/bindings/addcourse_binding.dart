import 'package:get/get.dart';

import '../controllers/addcourse_controller.dart';

class AddcourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddcourseController>(
      () => AddcourseController(),
    );
  }
}
