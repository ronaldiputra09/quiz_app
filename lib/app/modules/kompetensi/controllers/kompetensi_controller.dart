import 'package:get/get.dart';
import 'package:quiz_app/app/models/kompetensi_model.dart';
import 'package:quiz_app/app/network/api_path.dart';
import 'package:quiz_app/app/network/dio_client.dart';

class KompetensiController extends GetxController {
  var dio = DioClient();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<KompetensiModel?> kompetensiGet() async {
    try {
      final response = await dio.get(ApiPath.KOMPETENSI);
      var data = KompetensiModel.fromJson(response.data['data']);
      return data;
    } catch (e) {
      print("Kompetensi Error: $e");
      return null;
    }
  }
}
