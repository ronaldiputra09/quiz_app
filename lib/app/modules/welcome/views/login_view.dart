import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/app/data/themes.dart';
import 'package:quiz_app/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:quiz_app/app/widgets/button_widget.dart';
import 'package:quiz_app/app/widgets/form_widget.dart';

class LoginView extends GetView {
  LoginView({Key? key}) : super(key: key);
  final welcomeC = Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg_welcome.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            padding: EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Image.asset('assets/ic_reload.png', width: 42),
                      ),
                    ),
                    SizedBox(height: 10),
                    FormWidget(
                      hint: "Nama lengkap anda..",
                      controller: welcomeC.namaLengkap.value,
                    ),
                    SizedBox(height: 10),
                    FormWidget(
                      hint: "Tanggal lahir anda..",
                      controller: TextEditingController(
                        text: DateFormat('dd-MM-yyyy').format(
                          welcomeC.tanggalLahir.value,
                        ),
                      ),
                      read: true,
                      onTap: () {
                        welcomeC.getTanggal();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: welcomeC.isLaki.value,
                          onChanged: (value) {
                            welcomeC.isLaki.value = value!;
                            welcomeC.isPerempuan.value = false;
                            welcomeC.jenisKelamin.value = "Laki-Laki";
                          },
                        ),
                        Text(
                          "Laki-laki",
                          style: baloo.copyWith(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(width: 40),
                        Checkbox(
                          value: welcomeC.isPerempuan.value,
                          onChanged: (value) {
                            welcomeC.isPerempuan.value = value!;
                            welcomeC.isLaki.value = false;
                            welcomeC.jenisKelamin.value = "Perempuan";
                          },
                        ),
                        Text(
                          "Perempuan",
                          style: baloo.copyWith(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                    ButtonWidget(
                      title: "Simpan dan Lanjutkan",
                      textColor: blackColor,
                      textSize: 14.0,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      border: true,
                      borderColor: primaryBlueSky,
                      color: accentBlueSky,
                      loading: welcomeC.isLoading.value,
                      onPressed: () {
                        welcomeC.registrasiSiswa();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
