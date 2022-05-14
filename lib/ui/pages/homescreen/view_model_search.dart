import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasapplikasi/models/Api/api_warga.dart';
import 'package:kasapplikasi/models/api_models.dart';


class SearchViewModel extends ChangeNotifier {
  List<KasMasuk> _listkasmasuk = [];
  List<KasMasuk> get kasmasuk => _listkasmasuk;

  List<KasMasuk> _listkas= [];
  List<KasMasuk> get listkas => _listkas;

  getKasMasuk(query) async {
    final getKasMasuk = await ListWargaApi.getKasMasuk();
    _listkasmasuk = getKasMasuk;

    if (query == "") {
      return _listkas.clear();
    } else if (query != null) {
      return _listkas = _listkasmasuk
          .where((element) =>
              element.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}