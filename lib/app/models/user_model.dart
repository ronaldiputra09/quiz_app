class UserModel {
  String? namaSiswa;
  String? tanggalLahir;
  String? jenisKelamin;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserModel(
      {this.namaSiswa,
      this.tanggalLahir,
      this.jenisKelamin,
      this.updatedAt,
      this.createdAt,
      this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    namaSiswa = json['nama_siswa'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_siswa'] = this.namaSiswa;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
