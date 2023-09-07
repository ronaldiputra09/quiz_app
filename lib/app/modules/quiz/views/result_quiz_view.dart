import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/data/themes.dart';
import 'package:quiz_app/app/models/soal_model.dart';
import 'package:quiz_app/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:quiz_app/app/widgets/button_widget.dart';

class ResultQuizView extends GetView {
  ResultQuizView({Key? key}) : super(key: key);
  final quizC = Get.put(QuizController());
  final List<SoalModel> dataResult = Get.arguments ?? [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg_menu.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: Get.width,
          margin: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Image.asset('assets/ic_home.png'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      "Pembahasan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      "Soal ${quizC.indexSoal.value} / ${dataResult.length}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => PageView.builder(
                    controller: quizC.pageController.value,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (value) {
                      quizC.indexSoal.value = value + 1;
                    },
                    itemCount: dataResult.length,
                    itemBuilder: (context, index) {
                      final data = dataResult[index];
                      return Container(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "  ${data.jawabanSiswa == data.soal!.jawaban.toString().toUpperCase() ? "BENAR" : "SALAH : Jawaban betul yaitu ${data.soal!.jawaban.toString().toUpperCase()}"}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Html(
                                data: "${data.soal!.soal}",
                                shrinkWrap: true,
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "A",
                                    groupValue: data.jawabanSiswa,
                                    onChanged: (value) {},
                                  ),
                                  Text("${data.soal!.pilihanA}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "B",
                                    groupValue: data.jawabanSiswa,
                                    onChanged: (value) {},
                                  ),
                                  Text("${data.soal!.pilihanB}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "C",
                                    groupValue: data.jawabanSiswa,
                                    onChanged: (value) {},
                                  ),
                                  Text("${data.soal!.pilihanC}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "D",
                                    groupValue: data.jawabanSiswa,
                                    onChanged: (value) {},
                                  ),
                                  Text("${data.soal!.pilihanD}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => quizC.pageController.value.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      ),
                      icon: Image.asset('assets/ic_left.png'),
                    ),
                    quizC.indexSoal.value == 10
                        ? Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: ButtonWidget(
                                title: "Kembali",
                                textSize: 14.0,
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                          )
                        : SizedBox(),
                    IconButton(
                      onPressed: () => quizC.pageController.value.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      ),
                      icon: Image.asset('assets/ic_right.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
