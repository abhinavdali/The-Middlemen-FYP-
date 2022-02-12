import 'package:flutter/material.dart' ;
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Driver/Home/driver_home.dart';
import 'package:the_middlemen/UI/Driver/Profile/driver_profile.dart';

class BottomNavigationDriver extends StatefulWidget {
  const BottomNavigationDriver({Key? key}) : super(key: key);

  @override
  _BottomNavigationDriverState createState() => _BottomNavigationDriverState();
}

class _BottomNavigationDriverState extends State<BottomNavigationDriver> {
  int _currentIndex = 0;

  final _children = [
    DriverHome(),
    DriverProfile(),
  ];

  void _onChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        fixedColor: kStyleAppColor,
        unselectedItemColor: Colors.grey.shade700,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/BottomNav/home.png'),
            ),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/BottomNav/profile.png'),
            ),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
        onTap: _onChanged,
      ),
    );
  }
}
