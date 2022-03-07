import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_destination.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_package_option.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_payment.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_type.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/tracking_label.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';

class ShipNow extends StatefulWidget {
  const ShipNow({Key? key}) : super(key: key);

  @override
  State<ShipNow> createState() => _ShipNowState();
}

class _ShipNowState extends State<ShipNow> {
  int _currentIndex = 0;
  bool _isSelectedPrev = false;
  bool _isSelectedNext = true;
  final _children = [
    SelectType(),
    SelectDestination(),
    SelectPackage(),
    SelectPayment(),
    TrackingLabel(),
  ];

  void _onChanged(int index) {
    if(_isSelectedPrev == true){
     setState(() {
       _currentIndex--;
     });
    }else if(_isSelectedNext == true){
      setState(() {
        _currentIndex++;
      });
      print(_currentIndex);
      print(_isSelectedNext);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Ship Now',
      ),
      resizeToAvoidBottomInset: false,
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.15.sp,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_currentIndex != 0)
              PreviousBtn(() {
                setState(() {
                  _currentIndex--;
                });
              }),
            if(_currentIndex!= (_currentIndex - 1) &&
    _currentIndex != 0)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NextBtn(() {
                      setState(() {
                        _currentIndex++;
                      });
                      }),
                  ],
                ),
              ),
            if ( _currentIndex == 0)

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NextBtn(() {
                      setState(() {
                        _currentIndex++;
                      });
                    }),
                  ],
                ),
              ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   backgroundColor: Colors.white,
      //   showSelectedLabels: true,
      //   showUnselectedLabels: true,
      //   fixedColor: kStyleAppColor,
      //   unselectedItemColor: Colors.grey.shade700,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         onPressed: () {
      //           setState(() {
      //             _isSelectedNext = !_isSelectedNext;
      //             _isSelectedPrev = !_isSelectedPrev;
      //           });
      //         },
      //         icon: Icon(Icons.arrow_back_ios),
      //       ),
      //       label: 'Previous',
      //       backgroundColor: Colors.black,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         onPressed: () {
      //           setState(() {
      //             _isSelectedNext = !_isSelectedNext;
      //             _isSelectedPrev = !_isSelectedPrev;
      //           });
      //         },
      //         icon: Icon(Icons.arrow_forward_ios),
      //       ),
      //       label: 'Next',
      //       backgroundColor: Colors.black,
      //     ),
      //   ],
      //   onTap: _onChanged,
      // ),
    );
  }
}


