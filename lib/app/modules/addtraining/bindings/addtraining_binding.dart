import 'package:get/get.dart';

import '../controllers/addtraining_controller.dart';

class AddtrainingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddtrainingController>(
      () => AddtrainingController(),
    );
  }
}
