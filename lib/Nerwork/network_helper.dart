import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:the_middlemen/Models/Customer%20Models/login.dart';
import 'package:http/http.dart' as http;

class NetworkHelper{
  final baseurl = 'http://192.168.100.78:8000';
  Future<dynamic> getLoginData(
      String username,
      String password,
      ) async {
    var loginModel;
    print(username);
      var response = await http.post(
          Uri.parse('http://192.168.100.78:8000/api/login/'),
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: jsonEncode(<String, dynamic>{
            'username': username,
            'password': password,
          }),
      );

    print(response.statusCode);
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      print("login: $jsonMap");
      loginModel = Login.fromJson(jsonMap);
    }
    return loginModel;
  }
}
