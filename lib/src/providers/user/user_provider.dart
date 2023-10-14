import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddressLocation {
  AddressLocation({required this.lat, required this.long});

  String? lat;
  String? long;
}

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
  XFile? _profilePhoto;

// email
  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  String get email => _email ?? "";

// username
  set setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  String get username => _username ?? "";

// password
  set setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String get password => _password ?? "";

// firstName
  set setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  String get firstName => _firstName ?? "";

// lastname
  set setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  String get lastName => _lastName ?? "";

// mobilenumber
  set setMobileNumber(String mobileNum) {
    _contactNumber = mobileNum;
    notifyListeners();
  }

  String get mobileNumber => _contactNumber ?? "";

  set setProfilePhoto(XFile photo) {
    _profilePhoto = photo;
    notifyListeners();
  }

  void setProfilePhotoNull() {
    _profilePhoto = null;
    notifyListeners();
  }

  XFile? get profilePhoto => _profilePhoto;

  set setAddress(String address) {
    _address = address;
    notifyListeners();
  }

  String? get address => _address;
}
