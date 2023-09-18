import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/app/data/themes.dart';
import 'package:quiz_app/app/models/soal_model.dart';
import 'package:quiz_app/app/models/user_model.dart';
import 'package:quiz_app/app/modules/quiz/views/result_quiz_view.dart';
import 'package:quiz_app/app/network/api_path.dart';
import 'package:quiz_app/app/network/dio_client.dart';
import 'package:quiz_app/app/widgets/button_widget.dart';

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
  Timer? countdownTimer;
  var myDuration = Duration(minutes: 10).obs;
  @override
  void onInit() {
    super.onInit();
    pageController.value = PageController(
      initialPage: indexSoal.value - 1,
    );
    startTimer();
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

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    final seconds = myDuration.value.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
      submitQuizPost().then((value) {
        if (value == true) {
          showSkor();
        }
      });
    } else {
      myDuration.value = Duration(seconds: seconds);
    }
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

  Future showSkor() {
    return Get.defaultDialog(
      onWillPop: () async => false,
      barrierDismissible: false,
      title: "",
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      content: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.back();
                  },
                  child: Image.asset('assets/ic_home.png', width: 42),
                ),
                Expanded(
                  child: Text(
                    "Hasil Quiz",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(width: 42),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nama",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${siswa.value.namaSiswa}",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Skor",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${nilai.value}",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonWidget(
                            title: "Coba lagi",
                            textSize: 14.0,
                            color: redColor,
                            textColor: whiteColor,
                            onPressed: () {
                              Get.back();
                              Get.back();
                            },
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ButtonWidget(
                            title: "Pembahasan",
                            textSize: 14.0,
                            color: primaryBlue,
                            textColor: whiteColor,
                            onPressed: () {
                              Get.back();
                              Get.back();
                              pageController.value.jumpToPage(0);
                              Get.to(
                                () => ResultQuizView(),
                                arguments: dataResult,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
