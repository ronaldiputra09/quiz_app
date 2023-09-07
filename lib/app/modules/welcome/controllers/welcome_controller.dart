import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/app/network/api_path.dart';
import 'package:quiz_app/app/network/dio_client.dart';

class WelcomeController extends GetxController {
  final dio = DioClient();
  final box = GetStorage();
  var isLaki = false.obs;
  var isPerempuan = false.obs;
  var namaLengkap = TextEditingController().obs;
  var tanggalLahir = DateTime.now().obs;
  var jenisKelamin = "".obs;
  var isLoading = false.obs;
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

  void getTanggal() async {
    DateTime? ambilTgl = await showDatePicker(
      context: Get.context!,
      initialDate: tanggalLahir.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(Duration(days: 361)),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      cancelText: "Batal",
      confirmText: "Yakin",
      currentDate: tanggalLahir.value,
    );
    tanggalLahir.value = ambilTgl!;
  }

  Future registrasiSiswa() async {
    isLoading(true);
    try {
      final response = await dio.post(
        ApiPath.REGISTER,
        data: {
          "nama_siswa": namaLengkap.value.text,
          "tanggal_lahir": DateFormat("yyyy-MM-dd").format(tanggalLahir.value),
          "jenis_kelamin": jenisKelamin.value,
        },
      );
      if (response.statusCode == 201) {
        var data = response.data['data'];
        box.write("siswa", data);
        Get.offAllNamed("/home");
      }
    } catch (e) {
      print(e);
    }
    isLoading(false);
  }
}
