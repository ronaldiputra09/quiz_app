import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quiz_app/app/models/history_model.dart';
import 'package:quiz_app/app/models/materi_model.dart';
import 'package:quiz_app/app/models/profile_model.dart';

import 'package:quiz_app/app/models/user_model.dart';
import 'package:quiz_app/app/network/api_path.dart';
import 'package:quiz_app/app/network/dio_client.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  var dio = DioClient();
  var siswa = UserModel().obs;
  var dataMateri = <MateriModel>[].obs;
  var dataHistory = <HistoryModel>[].obs;
  var isPlaying = false.obs;
  var dataMusik = <String>[
    "assets/musik_1.mp3",
    "assets/musik_2.mp3",
    "assets/musik_3.mp3",
    "assets/musik_4.mp3",
    "assets/musik_5.mp3",
  ].obs;
  var musikPlay = "assets/musik_2.mp3".obs;
  final player = AudioPlayer();
  @override
  void onInit() async {
    super.onInit();
    if (box.read('siswa') != null) {
      siswa.value = UserModel.fromJson(box.read('siswa'));
    }
    changeMusik(musikPlay.value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeMusik(String musik) {
    player.stop();
    player.setAsset(musik);
    player.setLoopMode(LoopMode.one);
    player.play();
    print("JALAN");
  }

  void reloadGame() {
    player.dispose();
    box.erase();
    Get.offAllNamed('/welcome');
  }

  Future<List<MateriModel>?> materiGet() async {
    try {
      var response = await dio.get(ApiPath.MATERI);
      var data = response.data;
      dataMateri.value = MateriModel.fromJsonList(data['data']);
    } catch (e) {
      print("kategoriGet error: $e");
    }
    return null;
  }

  Future<ProfileModel?> profileGet() async {
    try {
      var response = await dio.get(ApiPath.PROFILE);
      var data = response.data;
      return ProfileModel.fromJson(data['data']);
    } catch (e) {
      print("profileGet error: $e");
    }
    return null;
  }

  Future<List<HistoryModel>?> historyGet() async {
    try {
      var response = await dio.get(ApiPath.HISTORY);
      var data = response.data;
      dataHistory.value = HistoryModel.fromJsonList(data['data']);
    } catch (e) {
      print("historyGet error: $e");
    }
    return null;
  }
}
