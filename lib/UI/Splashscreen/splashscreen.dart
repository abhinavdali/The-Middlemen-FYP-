import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_middlemen/UI/Select%20User/select_user.dart';

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
    Timer(
      const Duration(seconds: 3),
          () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const SelectUser(),
          ),
        );
      },
    );
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
              ClipOval(
                child: Image.asset('assets/Logo/logo2.png'
                  ,height: 230,
                  width: 230,fit: BoxFit.fill,),
              ),
              const SizedBox(height: 72),
              const SpinKitThreeBounce(
                color: Color(0xff00E7FD),
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
