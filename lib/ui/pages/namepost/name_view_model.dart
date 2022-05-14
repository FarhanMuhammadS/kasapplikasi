import 'package:flutter/cupertino.dart';
import 'package:kasapplikasi/models/Api/api_warga.dart';


class NameViewModel extends ChangeNotifier{
  postNameWarga(warga) async {
    await ListWargaApi.postNameWarga(wargalist: warga);
  }
}