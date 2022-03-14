import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/BottomNavBar/bottom_nav_cus.dart';
import 'package:the_middlemen/UI/Customer/Home/cus_home.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/ship_now.dart';
import 'package:the_middlemen/UI/Driver/BottomNavBar/bottom_nav_driver.dart';
import 'package:the_middlemen/UI/Select%20User/select_user.dart';

String? finalUN;
bool isCustomer = true;

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
          finalUN == null ?
          Navigator.pushReplacement(context,
              MaterialPageRoute(
                  builder: (context) {
                    return const CusHome();
                  })) :
           isCustomer ? Navigator.pushReplacement(context,
              MaterialPageRoute(
                  builder: (context) {
                    return const BottomNavigationCus();
                  })) : Navigator.pushReplacement(context,
              MaterialPageRoute(
                  builder: (context) {
                    return const BottomNavigationDriver();
                  }));
            },
      );
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    // late bool is_Customer =
    //     Provider.of<DataProvider>(context, listen: false).isCustomer;
    var username = sharedPreferences.getString('username');
    var d_username = sharedPreferences.getString('d_username');
    var fName = sharedPreferences.getString('fName');
    var lName = sharedPreferences.getString('lName');
    var phone = sharedPreferences.getString('phone');
    var email = sharedPreferences.getString('email');
    var license = sharedPreferences.getString('license');
    var vehicle = sharedPreferences.getString('vehicle');
    context.read<DataProvider>().firstName(fName);
    context.read<DataProvider>().lastName(lName);
    context.read<DataProvider>().pNumber(phone);
    context.read<DataProvider>().licenseN(license,vehicle);
    setState(() {
      if(username != null) {
        finalUN = username;
        setState(() {
          isCustomer = true;
        });
      }else if(d_username != null){
        finalUN = d_username;
        setState(() {
          isCustomer = false;
        });
      }
      // isCustomer = is_Customer;
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