import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/data/themes.dart';
import 'package:quiz_app/app/models/kompetensi_model.dart';
import 'package:quiz_app/app/widgets/loading_widget.dart';

import '../controllers/kompetensi_controller.dart';

class KompetensiView extends GetView<KompetensiController> {
  KompetensiView({Key? key}) : super(key: key);
  final kompetensiC = Get.put(KompetensiController());
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
                  GestureDetector(
                    onTap: () {
                      // Get.offAllNamed('/home');
                      Get.back();
                    },
                    child: Image.asset('assets/ic_home.png', width: 42),
                  ),
                  Expanded(
                    child: Text(
                      "Kompetensi",
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
                child: SingleChildScrollView(
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: FutureBuilder<KompetensiModel?>(
                      future: kompetensiC.kompetensiGet(),
                      builder: (context, snapshot) {
                        final data = snapshot.data;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return LoadingWidget(color: primaryBlue);
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Media Pembelajaran Interaktif",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Mata Pelajaran : ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                ),
                                Text(
                                  "${data?.mataPelajaran}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Kelas / Semester : ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                ),
                                Text(
                                  "${data?.kelas} / ${data?.semester}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tingkat : ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                ),
                                Text(
                                  "${data?.tingkat}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // show text html to text widget
                            Html(
                              data: data?.isi,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
