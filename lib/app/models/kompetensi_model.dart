class KompetensiModel {
  int? id;
  String? mataPelajaran;
  String? kelas;
  String? semester;
  String? tingkat;
  String? isi;
  String? createdAt;
  String? updatedAt;

  KompetensiModel(
      {this.id,
      this.mataPelajaran,
      this.kelas,
      this.semester,
      this.tingkat,
      this.isi,
      this.createdAt,
      this.updatedAt});

  KompetensiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mataPelajaran = json['mata_pelajaran'];
    kelas = json['kelas'];
    semester = json['semester'];
    tingkat = json['tingkat'];
    isi = json['isi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mata_pelajaran'] = this.mataPelajaran;
    data['kelas'] = this.kelas;
    data['semester'] = this.semester;
    data['tingkat'] = this.tingkat;
    data['isi'] = this.isi;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
