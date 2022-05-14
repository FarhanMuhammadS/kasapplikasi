import 'package:flutter/material.dart';
import 'package:kasapplikasi/models/Api/api_warga.dart';
import 'package:kasapplikasi/models/api_models.dart';

class InputViewmodel extends ChangeNotifier {
   List<KasMasuk> _kasmasuk = [];
   List get kasmasuk => _kasmasuk;

  getAllListWarga(kaswarga) async {
    await ListWargaApi.postWarga(wargamasuk: kaswarga);
  }

  getKasMasuk() async {
    final getkasmasuk = await ListWargaApi.getKasMasuk();
    _kasmasuk = getkasmasuk;
    _kasmasuk.sort(
        ((a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase())));
    notifyListeners();
  }

  void postNameWarga(WargaModel wargaModel) {}
}
