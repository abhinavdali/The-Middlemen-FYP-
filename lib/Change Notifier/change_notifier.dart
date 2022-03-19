import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  var fName;
  var lName;
  var phoneNumber;
  late bool isCustomer;
  var license;
  var vehicle;
  late var parcelType;
  var weightT;
  var sizeT;
  var dist;
  var pacType;

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

  void partype(var partype, var weight, var size){
    parcelType = partype;
    weightT = weight;
    sizeT = size;
    notifyListeners();
  }

  void distance(var distance){
    dist = distance;
    notifyListeners();
  }

  void packageType(var packageType){
    pacType = packageType;
    notifyListeners();
  }
}