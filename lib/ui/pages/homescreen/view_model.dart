import 'package:flutter/cupertino.dart';
import '../../../models/api_models.dart';

class Viewmodel extends ChangeNotifier {
  final List<WargaModel> _myWarga = [];

  List get mywarga => _myWarga;

  // getAllListWarga() {}
}
