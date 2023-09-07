class MateriModel {
  int? id;
  int? kategoriId;
  String? nama;
  String? isi;
  String? createdAt;
  String? updatedAt;

  MateriModel(
      {this.id,
      this.kategoriId,
      this.nama,
      this.isi,
      this.createdAt,
      this.updatedAt});

  MateriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategoriId = json['kategori_id'];
    nama = json['nama'];
    isi = json['isi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kategori_id'] = this.kategoriId;
    data['nama'] = this.nama;
    data['isi'] = this.isi;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  static List<MateriModel> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((item) => MateriModel.fromJson(item)).toList();
  }
}
