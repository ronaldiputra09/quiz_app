class ProfileModel {
  int? id;
  String? nama;
  String? prodi;
  String? fakultas;
  String? universitas;
  String? email;
  String? createdAt;
  String? updatedAt;

  ProfileModel(
      {this.id,
      this.nama,
      this.prodi,
      this.fakultas,
      this.universitas,
      this.email,
      this.createdAt,
      this.updatedAt});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    prodi = json['prodi'];
    fakultas = json['fakultas'];
    universitas = json['universitas'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['prodi'] = this.prodi;
    data['fakultas'] = this.fakultas;
    data['universitas'] = this.universitas;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
