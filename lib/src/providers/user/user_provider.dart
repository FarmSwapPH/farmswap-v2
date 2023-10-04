import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _address;
  String? _birthDate;
  String? _birthPlace;
  String? _contactNumber;
  List? _docRequirements;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _idUrl;
  List? _userAcc;
  String? _username;
  String? _profileUrl;
  String? _registrationDate;
  String? _userId;
  String? _userRole;
  String? _password;

// email
  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  String get email => _email ?? "email";

// username
  set setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  String get username => _username ?? "username";

// password
  set setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String get password => _password ?? "password";

// firstName
  set setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  String get firstName => _firstName ?? "firstname";

// lastname
  set setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  String get lastName => _lastName ?? "lastname";

// mobilenumber
  set setMobileNumber(String mobileNum) {
    _contactNumber = mobileNum;
    notifyListeners();
  }

  String get mobileNumber => _contactNumber ?? "contact number";
}
