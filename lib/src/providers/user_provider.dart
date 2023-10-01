// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _email;
  String? _username;
  String? _password;
  String? _firstName;
  String? _lastName;
  String? _mobileNumber;
  String? _location;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void setlastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void setMobileNumber(String mobileNumber) {
    _mobileNumber = mobileNumber;
    notifyListeners();
  }

  void setLocation(String location) {
    _location = location;
    notifyListeners();
  }

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  String get username => _username!;
}
