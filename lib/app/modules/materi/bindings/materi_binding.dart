import 'package:get/get.dart';

import '../controllers/materi_controller.dart';

class MateriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MateriController>(
      () => MateriController(),
    );
  }
}
