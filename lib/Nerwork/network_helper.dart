import 'dart:convert';
import 'dart:io';
import 'package:the_middlemen/Models/Customer%20Models/login.dart';
import 'package:http/http.dart' as http;
import 'package:the_middlemen/Models/Customer%20Models/pricing.dart';
import 'package:the_middlemen/Models/Customer%20Models/signup.dart';

class NetworkHelper{
  final baseurl = 'http://192.168.100.66:8000';

  Future<dynamic> getDriverLoginData(
      String username,
      String password,
      ) async {
    var loginModel;
    print(username);
    var response = await http.post(
      Uri.parse('$baseurl/api/login/driver'),
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

  Future<dynamic> getCusLoginData(
      String username,
      String password,
      ) async {
    var loginModel;
      var response = await http.post(
          Uri.parse('$baseurl/api/login/customer'),
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

  Future<dynamic> getCusSignUpData(
      String username,
      String email,
      String first_name,
      String last_name,
      String password,
      String phone
      ) async {
    var model;
    var response = await http.post(
      Uri.parse('$baseurl/api/register/customer'),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'email' : email,
        'first_name' : first_name,
        'last_name' : last_name,
        'phone': phone,
        'password': password,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      model = SignUp.fromJson(jsonMap);
    }
    return model;
  }

  Future<dynamic> getDriverSignUpData(
      String username,
      String email,
      String first_name,
      String last_name,
      String password,
      String phone,
      String license,
      String vehicle
      ) async {
    var Model;
    var response = await http.post(
      Uri.parse('$baseurl/api/register/driver'),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'email' : email,
        'first_name' : first_name,
        'last_name' : last_name,
        'password': password,
        'phone': phone,
        'license' : license,
        'vehicle_number' : vehicle
      }),
    );
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      Model = SignUp.fromJson(jsonMap);
    }
    return Model;
  }

  Future<dynamic> getPricingData() async {
    var pricing;
    var response = await http.get(
      Uri.parse('$baseurl/api/pricing'),
    );
    if (response.statusCode == 200){
      // List<Pricing> list = parseAgents(response.body);
      var data = response.body;

      var jsonMap = jsonDecode(data);
      pricing = Pricing.fromJson(jsonMap);
      return pricing;
    }

  }
  static List<Pricing> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Pricing>((json) => Pricing.fromJson(json)).toList();
  }
}





