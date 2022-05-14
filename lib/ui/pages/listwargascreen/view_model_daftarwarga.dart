import 'package:flutter/cupertino.dart';
import 'package:kasapplikasi/models/Api/api_warga.dart';
import 'package:kasapplikasi/models/api_models.dart';

class Daftarmodel extends ChangeNotifier {
  List<WargaModel> _myWarga = [];
  List get warga => _myWarga;
  getAllListWarga() async {
    var mywarga = await ListWargaApi.getListWarga();
    _myWarga = mywarga;
    notifyListeners();
  }
}
