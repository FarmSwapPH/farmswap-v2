import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  late String _address;
  late String _birthDate;
  late String _birthPlace;
  late String _contactNumber;
  late List _docRequirements;
  late String _email;
  late String _firstName;
  late String _lastName;
  late String _idUrl;
  late List _userAcc;
  late String _username;
  late String _profileUrl;
  late String _registrationDate;
  late String _userId;
  late String _userRole;
  late String _password;

// email
  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  String get email => _email;

// username
  set setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  String get username => _username;

// password
  set setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String get password => _password;

// firstName
  set setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  String get firstName => _firstName;

// lastname
  set setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  String get lastName => _lastName;

// mobilenumber
  set setMobileNumber(String mobileNum) {
    _contactNumber = mobileNum;
    notifyListeners();
  }

  String get mobileNumber => _contactNumber;
}
