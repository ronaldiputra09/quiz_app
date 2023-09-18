import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/data/themes.dart';
import 'package:quiz_app/app/models/soal_model.dart';
import 'package:quiz_app/app/widgets/button_widget.dart';
import 'package:quiz_app/app/widgets/loading_widget.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  QuizView({Key? key}) : super(key: key);
  final quizC = Get.put(QuizController());
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
                  SizedBox(width: 10),
                  Obx(
                    () => Text(
                      "Waktu ${quizC.myDuration.value.inMinutes} : ${quizC.myDuration.value.inSeconds.remainder(60)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => Text(
                      "Soal ${quizC.indexSoal.value} / ${quizC.dataJawaban.length}",
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
                child: FutureBuilder<List<SoalModel>?>(
                  future: quizC.startQuizGet(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingWidget(color: primaryBlue);
                    }
                    return Obx(
                      () => PageView.builder(
                        controller: quizC.pageController.value,
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: (value) {
                          quizC.indexSoal.value = value + 1;
                        },
                        itemCount: quizC.dataSoal.length,
                        itemBuilder: (context, index) {
                          final data = quizC.dataSoal[index];
                          return Container(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Html(
                                    data: "${data.soal!.soal}",
                                    shrinkWrap: true,
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "A",
                                        groupValue: quizC.dataJawaban[index]
                                            ['jawaban_siswa'],
                                        onChanged: (value) {
                                          quizC.dataJawaban[index]
                                              ['jawaban_siswa'] = value;
                                          quizC.pageController.update((_) {});
                                        },
                                      ),
                                      Text("${data.soal!.pilihanA}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "B",
                                        groupValue: quizC.dataJawaban[index]
                                            ['jawaban_siswa'],
                                        onChanged: (value) {
                                          quizC.dataJawaban[index]
                                              ['jawaban_siswa'] = value;
                                          quizC.pageController.update((_) {});
                                        },
                                      ),
                                      Text("${data.soal!.pilihanB}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "C",
                                        groupValue: quizC.dataJawaban[index]
                                            ['jawaban_siswa'],
                                        onChanged: (value) {
                                          quizC.dataJawaban[index]
                                              ['jawaban_siswa'] = value;
                                          quizC.pageController.update((_) {});
                                        },
                                      ),
                                      Text("${data.soal!.pilihanC}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "D",
                                        groupValue: quizC.dataJawaban[index]
                                            ['jawaban_siswa'],
                                        onChanged: (value) {
                                          quizC.dataJawaban[index]
                                              ['jawaban_siswa'] = value;
                                          quizC.pageController.update((_) {});
                                        },
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
                    );
                  },
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
                                title: "Submit",
                                textSize: 14.0,
                                onPressed: () {
                                  quizC.submitQuizPost().then((value) {
                                    if (value == true) {
                                      quizC.showSkor();
                                    }
                                  });
                                  // showSkor();
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
