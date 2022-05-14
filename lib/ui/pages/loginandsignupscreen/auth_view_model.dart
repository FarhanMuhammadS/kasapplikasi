import 'package:flutter/material.dart';
import 'package:kasapplikasi/models/auth_api/auth_api.dart';


class AuthViewModel extends ChangeNotifier {
  signIn(String email, String password) async {
    await AuthApi.signIn(email, password);
    notifyListeners();
  }

  signUp(String email, String password) async {
    await AuthApi.signUp(email, password);
    notifyListeners();
  }
}
