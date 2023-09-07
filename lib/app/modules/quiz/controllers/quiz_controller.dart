import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/app/models/soal_model.dart';
import 'package:quiz_app/app/models/user_model.dart';
import 'package:quiz_app/app/network/api_path.dart';
import 'package:quiz_app/app/network/dio_client.dart';

class QuizController extends GetxController {
  final box = GetStorage();
  var dio = DioClient();
  var siswa = UserModel().obs;
  var dataSoal = <SoalModel>[].obs;
  var dataResult = <SoalModel>[].obs;
  var nilai = 0.obs;
  var dataJawaban = [].obs;
  var indexSoal = 1.obs;
  var token = "".obs;
  var pageController = PageController().obs;
  @override
  void onInit() {
    super.onInit();
    pageController.value = PageController(
      initialPage: indexSoal.value - 1,
    );
    if (box.read('siswa') != null) {
      siswa.value = UserModel.fromJson(box.read('siswa'));
    }
    // startQuizGet();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<SoalModel>?> startQuizGet() async {
    dataSoal.clear();
    dataJawaban.clear();
    try {
      final response = await dio.get(
        ApiPath.QUIZ,
        queryParameters: {
          "siswa_id": siswa.value.id,
        },
      );
      final data = response.data;
      token.value = data['data']['token'];
      var decode = jsonDecode(data['data']['json']);
      dataSoal.value = SoalModel.fromJsonList(decode);
      for (var data in dataSoal) {
        dataJawaban.add({
          "soal_id": data.soal!.id,
          "jawaban_siswa": "",
        });
      }
    } catch (e) {
      print("error start quiz $e");
    }
    return null;
  }

  Future submitQuizPost() async {
    try {
      final response = await dio.post(
        ApiPath.SUBMIT_QUIZ,
        data: {
          "siswa_id": siswa.value.id,
          "token": token.value,
          "json": jsonEncode(dataJawaban),
        },
      );
      final data = response.data;
      dataResult.value =
          SoalModel.fromJsonList(jsonDecode(data['data']['json']));
      nilai.value = data['data']['nilai'];
      return true;
    } catch (e) {
      print("error submit quiz $e");
      return false;
    }
  }
}
