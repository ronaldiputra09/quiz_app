import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/app/animation/animation_widget.dart';
import 'package:quiz_app/app/data/themes.dart';
import 'package:quiz_app/app/modules/welcome/views/login_view.dart';
import 'package:quiz_app/app/widgets/button_widget.dart';
import 'package:quiz_app/app/widgets/form_widget.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  WelcomeView({Key? key}) : super(key: key);
  final welcomeC = Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            children: [
              Visibility(
                visible: !keyboardIsOpen,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    'assets/boy.png',
                    height: 240,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: AnimatedImage(
                        icon: 'assets/text.png',
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ButtonWidget(
                        title: "Mulai!",
                        radius: 30,
                        border: true,
                        borderColor: accentBlueSky,
                        textColor: whiteColor,
                        onPressed: () {
                          Get.to(() => LoginView());
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !keyboardIsOpen,
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/girl.png',
                    height: 240,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future dialogForm() {
    return Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.topRight,
                child: Image.asset('assets/ic_reload.png', width: 42),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Obx(
                () => Column(
                  children: [
                    FormWidget(
                      hint: "Nama lengkap anda..",
                      controller: welcomeC.namaLengkap.value,
                    ),
                    SizedBox(height: 10),
                    FormWidget(
                      hint: "Tanggal lahir anda..",
                      controller: TextEditingController(
                        text: DateFormat('yyyy-MM-dd').format(
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
          ],
        ),
      ),
    );
  }
}
