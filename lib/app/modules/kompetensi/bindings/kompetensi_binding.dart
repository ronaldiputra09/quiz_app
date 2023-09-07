import 'package:get/get.dart';

import '../controllers/kompetensi_controller.dart';

class KompetensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KompetensiController>(
      () => KompetensiController(),
    );
  }
}
