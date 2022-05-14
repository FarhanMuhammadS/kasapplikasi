import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:kasapplikasi/models/api_models.dart';


class ListWargaApi {
  static getListWarga() async{
    List<WargaModel> listWargaGet = [];
    final response = await Dio().get(
        'https://kasapplikasi-default-rtdb.firebaseio.com/warga.json',
    );
    
   (response.data as Map<String, dynamic>).forEach((key, value) {
      listWargaGet.add(WargaModel(
          name: value["name"],
          ));
    });
    return listWargaGet;
  }
  static postWarga({KasMasuk? wargamasuk}) async{
     await Dio().post(
      "https://kasapplikasi-default-rtdb.firebaseio.com/kasmasuk.json", 
      data: jsonEncode(wargamasuk)
    );
 }

 static getKasMasuk() async {
    List<KasMasuk> listkasmasuk = [];
    final response = await Dio().get(
        "https://kasapplikasi-default-rtdb.firebaseio.com/kasmasuk.json");

    (response.data as Map<String, dynamic>).forEach((key, value) {
      listkasmasuk.add(KasMasuk(
          name: value["name"],
          date: value["date"],
          nominal: value["nominal"],
          keterangan: value["keterangan"],
          ));
    });
   return listkasmasuk;
 } 

 static postNameWarga({WargaModel? wargalist}) async{
    await Dio().post(
      "https://kasapplikasi-default-rtdb.firebaseio.com/warga.json", 
      data: jsonEncode(wargalist)
    );
 }

  // getAllListWarga() {}
}

//  static getPostNovel()async{
//     List listPostDisplay = [];
//     final response = await Dio().get(
//       "https://loginregisauth-default-rtdb.firebaseio.com/PostNovel.json"
//     );
//     print(response.data);
//     (response.data as Map<String, dynamic>).forEach((key, value) {
//       listPostDisplay.add(NovelModel(
//          image: value["image"],
//           title: value["title"],
//           genre: value["genre"],
//           description: value["description"],
//           content: value["content"]
//       ))
