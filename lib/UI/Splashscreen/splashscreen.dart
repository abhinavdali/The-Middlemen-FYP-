import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/BottomNavBar/bottom_nav_cus.dart';
import 'package:the_middlemen/UI/Select%20User/select_user.dart';

String? finalUN;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValidationData().whenComplete(() {
      Timer(
        const Duration(seconds: 3),
            () {
          print(finalUN);
          finalUN == null ?
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) {
                    return const SelectUser();
                  })) :
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) {
                    return const BottomNavigationCus();
                  }));
        },
      );
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var username = sharedPreferences.getString('username');
    setState(() {
      finalUN = username;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/Logo/applogo.png', height: 180, width: 180,
              ),
              const SizedBox(height: 72),
              const SpinKitThreeBounce(
                color: kStyleAppColor,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}