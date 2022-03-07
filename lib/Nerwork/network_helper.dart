import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:the_middlemen/Models/Customer%20Models/login.dart';
import 'package:http/http.dart' as http;
import 'package:the_middlemen/Models/Customer%20Models/signup.dart';

class NetworkHelper{
  final baseurl = 'http://10.0.2.2:8000';
  Future<dynamic> getLoginData(
      String username,
      String password,
      ) async {
    var loginModel;
      var response = await http.post(
          Uri.parse('$baseurl/api/login/'),
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: jsonEncode(<String, dynamic>{
            'username': username,
            'password': password,
          }),
      );
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      print("login: $jsonMap");
      loginModel = Login.fromJson(jsonMap);
    }
    return loginModel;
  }

  Future<dynamic> getSignUpData(
      String username,
      String email,
      String first_name,
      String last_name,
      String password,
      String confirm_password
      ) async {
    var loginModel;
    var response = await http.post(
      Uri.parse('$baseurl/api/register/'),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'email' : email,
        'first_name' : first_name,
        'last_name' : last_name,
        'password': password,
        'confirm_password' : confirm_password
      }),
    );
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      print("login: $jsonMap");
      loginModel = SignUp.fromJson(jsonMap);
    }
    return loginModel;
  }
}
