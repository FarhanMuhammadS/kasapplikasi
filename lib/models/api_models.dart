class WargaModel {
  String? name;

  WargaModel({this.name});

  factory WargaModel.fromJson(Map<String, dynamic> json) {
    return WargaModel(
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
    };
  }
}

class KasMasuk {
  String? name;
  String? keterangan;
  String? date;
  String? nominal;

  KasMasuk({this.keterangan, this.name, this.date, this.nominal});

  factory KasMasuk.fromJson(Map<String, dynamic> json) {
    return KasMasuk(
      name: json["name"],
      keterangan: json["keterangan"],
      date: json["date"],
      nominal: json["nominal"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "keterangan": keterangan,
      "date": date,
      "nominal": nominal,
    };
  }
}
