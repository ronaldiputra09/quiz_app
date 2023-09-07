class SoalModel {
  int? no;
  Soal? soal;
  String? jawabanSiswa;
  int? nilai;

  SoalModel({this.no, this.soal, this.jawabanSiswa, this.nilai});

  SoalModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    soal = json['soal'] != null ? new Soal.fromJson(json['soal']) : null;
    jawabanSiswa = json['jawaban_siswa'];
    nilai = json['nilai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    if (this.soal != null) {
      data['soal'] = this.soal!.toJson();
    }
    data['jawaban_siswa'] = this.jawabanSiswa;
    data['nilai'] = this.nilai;
    return data;
  }

  static List<SoalModel> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((item) => SoalModel.fromJson(item)).toList();
  }
}

class Soal {
  int? id;
  int? kategoriId;
  String? soal;
  String? file;
  String? pilihanA;
  String? pilihanB;
  String? pilihanC;
  String? pilihanD;
  String? jawaban;
  String? createdAt;
  String? updatedAt;

  Soal(
      {this.id,
      this.kategoriId,
      this.soal,
      this.file,
      this.pilihanA,
      this.pilihanB,
      this.pilihanC,
      this.pilihanD,
      this.jawaban,
      this.createdAt,
      this.updatedAt});

  Soal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategoriId = json['kategori_id'];
    soal = json['soal'];
    file = json['file'];
    pilihanA = json['pilihan_a'];
    pilihanB = json['pilihan_b'];
    pilihanC = json['pilihan_c'];
    pilihanD = json['pilihan_d'];
    jawaban = json['jawaban'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kategori_id'] = this.kategoriId;
    data['soal'] = this.soal;
    data['file'] = this.file;
    data['pilihan_a'] = this.pilihanA;
    data['pilihan_b'] = this.pilihanB;
    data['pilihan_c'] = this.pilihanC;
    data['pilihan_d'] = this.pilihanD;
    data['jawaban'] = this.jawaban;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
