// import 'package:flutter_test/flutter_test.dart';
// import 'package:kasapplikasi/models/Api/api_warga.dart';
// import 'package:kasapplikasi/models/api_models.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'api_warga_test.mocks.dart';



// // @GenerateMocks([ListWargaApi])
// @GenerateMocks([ListWargaApi])
// void main(){
//    group('WargaApi', () {
//      ListWargaApi wargaApi = MockListWargaApi();
//      test('get all api listwarga', () async {
//          when(wargaApi.getAllListWarga()).thenAnswer(
//            (_) async => <WargaModel> [
//              WargaModel(name: 'name'),
//            ],
//          );
//       var warga= await wargaApi.getAllListWarga();
//       expect(warga.isNotEmpty, true);
//      });
//    });
// }