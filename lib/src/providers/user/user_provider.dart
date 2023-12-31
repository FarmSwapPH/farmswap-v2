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

  String? _email;
  String? _firstName;
  String? _lastName;
  String? _idUrl;
  String? _username;
  String? _profileUrl;
  String? _registrationDate;
  String? _userId;
  bool _isFarmer = false;
  String? _password;
  XFile? _profilePhoto;
  XFile? _frontId;
  XFile? _backId;

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

  set setIsFarmer(bool chosen) {
    _isFarmer = chosen;
    notifyListeners();
  }

  bool get isFarmer => _isFarmer;

  set setBirthDate(String date) {
    _birthDate = date;
    notifyListeners();
  }

  String? get birthDate => _birthDate;

  set setBirthPlace(String place) {
    _birthPlace = place;
    notifyListeners();
  }

  String? get birthplace => _birthPlace;

  set setFrontId(XFile photo) {
    _frontId = photo;
    notifyListeners();
  }

  void setFrontIdToNull() {
    _frontId = null;
    notifyListeners();
  }

  XFile? get frontId => _frontId;

  set setBackId(XFile photo) {
    _backId = photo;
    notifyListeners();
  }

  void setBackIdToNull() {
    _backId = null;
    notifyListeners();
  }

  XFile? get backID => _backId;
}
