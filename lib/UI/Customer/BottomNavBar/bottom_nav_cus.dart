import 'package:flutter/material.dart' ;
import 'package:the_middlemen/UI/Customer/Home/cus_home.dart';
import 'package:the_middlemen/UI/Customer/Profile/cus_profile.dart';
import 'package:the_middlemen/UI/Customer/Settings/settings.dart';

class BottomNavigationCus extends StatefulWidget {
  const BottomNavigationCus({Key? key}) : super(key: key);

  @override
  _BottomNavigationCusState createState() => _BottomNavigationCusState();
}

class _BottomNavigationCusState extends State<BottomNavigationCus> {
  int _currentIndex = 0;

  final _children = [
    CusHome(),
    CusProfile(),
    CusSettings()
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        fixedColor: const Color(0xFF5686D8),
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
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined
            ),
            label: 'Settings',
            backgroundColor: Colors.black,
          ),
        ],
        onTap: _onChanged,
      ),
    );
  }
}
