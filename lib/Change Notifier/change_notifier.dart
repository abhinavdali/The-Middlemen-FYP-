import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  var fName;
  var lName;
  var phoneNumber;

  void firstName(var firstName) {
    fName = firstName;
    notifyListeners();
  }

  void lastName(var lastName) {
    lName = lastName;
    notifyListeners();
  }

  void pNumber(var pNumber) {
    phoneNumber = pNumber;
    notifyListeners();
  }

}