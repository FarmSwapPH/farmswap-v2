import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  late String email;
  late String username;
  late String password;

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setUsername(String username) {
    this.username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }
}
