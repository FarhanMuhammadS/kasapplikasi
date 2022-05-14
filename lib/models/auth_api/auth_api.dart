import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kasapplikasi/models/auth_models.dart';


class AuthApi {
  static Future signIn(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBsfco1YgcexDcgWtPhIyXzt2iRN2eDdfw");
    var response = await http.post(url,
        body: jsonEncode(AuthModel(
            email: email, password: password, returnSecureToken: true)));

    if (jsonDecode(response.body)['error'] != null) {
      throw jsonDecode(response.body)['error']['message'];
    }
  }

  static Future<void> signUp(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBsfco1YgcexDcgWtPhIyXzt2iRN2eDdfw");
    var response = await http.post(url,
        body: jsonEncode(AuthModel(
            email: email, password: password, returnSecureToken: true)));

    if (jsonDecode(response.body)['error'] != null) {
      throw jsonDecode(response.body)['error']['message'];
    }
  }
}
