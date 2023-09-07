class KategoriModel {
  int? id;
  String? namaKategori;
  String? createdAt;
  String? updatedAt;

  KategoriModel({this.id, this.namaKategori, this.createdAt, this.updatedAt});

  KategoriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKategori = json['nama_kategori'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kategori'] = this.namaKategori;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  static List<KategoriModel> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((item) => KategoriModel.fromJson(item)).toList();
  }
}
