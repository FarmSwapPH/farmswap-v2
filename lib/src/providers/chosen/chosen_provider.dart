import 'package:flutter/material.dart';

class PaymentChosenProvider extends ChangeNotifier {
  bool _gcash = false;
  bool _maya = false;
  bool _gpay = false;

  set setGcash(bool chosen) {
    _gcash = chosen;

    notifyListeners();
  }

  bool get gcash => _gcash;

  set setMaya(bool chosen) {
    _maya = chosen;

    notifyListeners();
  }

  bool get maya => _maya;

  set setGpay(bool chosen) {
    _gpay = chosen;

    notifyListeners();
  }

  bool get gpay => _gpay;
}
