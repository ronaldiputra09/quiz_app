class HistoryModel {
  String? namaSiswa;
  int? umur;
  String? jenisKelamin;
  int? nilai;

  HistoryModel({this.namaSiswa, this.umur, this.jenisKelamin, this.nilai});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    namaSiswa = json['nama_siswa'];
    umur = json['umur'];
    jenisKelamin = json['jenis_kelamin'];
    nilai = json['nilai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_siswa'] = this.namaSiswa;
    data['umur'] = this.umur;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['nilai'] = this.nilai;
    return data;
  }

  static List<HistoryModel> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((item) => HistoryModel.fromJson(item)).toList();
  }
}
