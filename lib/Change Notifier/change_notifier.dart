import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  var fName;
  var lName;
  var phoneNumber;
  late bool isCustomer;
  var license;
  var vehicle;
  late var parcelType;

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

  void isCus(var isCus) {
    isCustomer = isCus;
    notifyListeners();
  }

  void licenseN(var licenseN, var vehicleN){
    license = licenseN;
    vehicle = vehicleN;
    notifyListeners();
  }

  void type(var type){
    parcelType = type;
    notifyListeners();
  }
}