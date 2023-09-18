import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/animation/animation_widget.dart';
import 'package:quiz_app/app/data/themes.dart';
import 'package:quiz_app/app/models/history_model.dart';
import 'package:quiz_app/app/models/materi_model.dart';
import 'package:quiz_app/app/models/profile_model.dart';
import 'package:quiz_app/app/widgets/button_widget.dart';
import 'package:quiz_app/app/widgets/loading_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final homeC = Get.put(HomeController());
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
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/boy.png',
                      height: 240,
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
                        Expanded(
                          child: Row(
                            children: [
                              buttonMenu(
                                title: "Kompetensi",
                                icon: Icons.library_books,
                                onPressed: () {
                                  // homeC.player.stop();
                                  Get.toNamed('/kompetensi');
                                },
                              ),
                              buttonMenu(
                                title: "Materi",
                                icon: Icons.menu_book,
                                onPressed: () => materi(),
                              ),
                              buttonMenu(
                                title: "Quiz",
                                icon: Icons.edit_document,
                                onPressed: () => startQuiz(),
                              ),
                              buttonMenu(
                                title: "History",
                                icon: Icons.emoji_events,
                                onPressed: () => history(),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Hallo, ${homeC.siswa.value.namaSiswa.toString().capitalize}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/girl.png',
                      height: 240,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: IconButton(
                onPressed: () => homeC.reloadGame(),
                icon: Image.asset(
                  'assets/ic_reload_2.png',
                ),
              ),
              top: 20,
              right: 20,
            ),
            Positioned(
              child: IconButton(
                onPressed: () => musik(),
                icon: Image.asset(
                  'assets/ic_volume.png',
                ),
              ),
              top: 20,
              left: 20,
            ),
            Positioned(
              child: IconButton(
                onPressed: () => profile(),
                icon: Image.asset(
                  'assets/ic_info.png',
                ),
              ),
              bottom: 20,
              left: 20,
            ),
            Positioned(
              child: IconButton(
                onPressed: () => tutor(),
                icon: Image.asset(
                  'assets/ic_question.png',
                ),
              ),
              bottom: 20,
              right: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonMenu({
    String? title,
    IconData? icon,
    Function()? onPressed,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/btn_menu.png'),
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: whiteColor,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "$title",
              style: TextStyle(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future startQuiz() {
    return Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      content: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset('assets/ic_home.png', width: 42),
                ),
                Expanded(
                  child: Text(
                    "Quiz",
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Petunjuk :",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "- Mari kita evaluasi hasil belajar dengan menjawab 10 pertanyaan soal pilihan ganda.\n\n- Pilihlah jawaban menurut anda paling tepat.\n\n- Klik tombol start untuk mulai mengerjakan soal.\n\n- Skor untuk masing-masing pertanyaan adalah 10.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 100),
                        child: ButtonWidget(
                          title: "Start",
                          textSize: 18.0,
                          onPressed: () {
                            Get.back();
                            Get.toNamed('/quiz');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future materi() {
    return Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      content: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset('assets/ic_home.png', width: 42),
                ),
                Expanded(
                  child: Text(
                    "Materi",
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
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FutureBuilder<List<MateriModel>?>(
                  future: homeC.materiGet(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingWidget(color: primaryBlue);
                    }
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: homeC.dataMateri.length,
                      itemBuilder: (context, index) {
                        final data = homeC.dataMateri[index];
                        return GestureDetector(
                          onTap: () {
                            Get.back();
                            Get.toNamed(
                              '/materi',
                              arguments: data,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/papan.png'),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                                left: 20,
                                right: 20,
                              ),
                              child: Center(
                                child: Text(
                                  "${data.nama}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future profile() {
    return Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      content: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset('assets/ic_home.png', width: 42),
                ),
                Expanded(
                  child: Text(
                    "Profile",
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
                    horizontal: 60,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FutureBuilder<ProfileModel?>(
                    future: homeC.profileGet(),
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingWidget(color: primaryBlue);
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nama lengkap : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                "${data?.nama}",
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
                                "Prodi : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                "${data?.prodi}",
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
                                "Fakultas : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                "${data?.fakultas}",
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
                                "Universitas : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                "${data?.universitas}",
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
                                "Email : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                "${data?.email}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Terima kasih telah menggunakan aplikasi ini",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: bold,
                            ),
                            textAlign: TextAlign.center,
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
    );
  }

  Future history() {
    return Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      content: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset('assets/ic_home.png', width: 42),
                ),
                Expanded(
                  child: Text(
                    "History",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  "Skor",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(width: 25),
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
                child: FutureBuilder<List<HistoryModel>?>(
                  future: homeC.historyGet(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingWidget(color: primaryBlue);
                    }
                    return ListView.builder(
                      itemCount: homeC.dataHistory.length,
                      itemBuilder: (context, index) {
                        final data = homeC.dataHistory[index];
                        return ListTile(
                          title: Text(
                            "${data.namaSiswa}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: bold,
                            ),
                          ),
                          subtitle: Text(
                            "${data.jenisKelamin} - ${data.umur} tahun",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          leading: CircleAvatar(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          trailing: Text(
                            "${data.nilai}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: bold,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future musik() {
    return Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      content: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset('assets/ic_home.png', width: 42),
                ),
                Expanded(
                  child: Text(
                    "Ganti Musik",
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
                child: ListView.builder(
                  itemCount: homeC.dataMusik.length,
                  itemBuilder: (context, index) {
                    final data = homeC.dataMusik[index];
                    return ListTile(
                      onTap: () {
                        homeC.musikPlay.value = data;
                        homeC.changeMusik(data);
                      },
                      title: Text(
                        "${data.split("/").last.replaceAll(".mp3", "").replaceAll("_", " ").capitalize}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      trailing: Obx(
                        () => homeC.musikPlay.value == data
                            ? CircleAvatar(child: Icon(Icons.play_arrow))
                            : SizedBox(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future tutor() {
    return Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      content: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset('assets/ic_home.png', width: 42),
                ),
                Expanded(
                  child: Text(
                    "Petunjuk",
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
                    horizontal: 60,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kompetensi :",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Berisi tentang kurikulum yang dipelajari oleh siswa",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Materi :",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Berisi tentang materi-materi yang dipelajari oleh siswa",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Quiz :",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Berisi tentang menguji kemampuan siswa dalam memahami materi",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "History :",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Berisi tentang riwayat quiz yang telah diikuti oleh siswa",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
