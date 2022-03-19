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
  final _children = [
    const SelectType(),
    SelectDestination(),
    const SelectPackage(),
    const SelectPayment(),
    const TrackingLabel(),
  ];
  // late List selectedParcelType =
  //     Provider.of<DataProvider>(context, listen: false).parcelType;
  // late bool isSelected = context.watch<DataProvider>().type();
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
        decoration: const BoxDecoration(
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
            if(_currentIndex!= (_currentIndex - 1) && _currentIndex != 0)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NextBtn(() {
                      setState(() {
                        if(_currentIndex != 4){
                          _currentIndex++;
                        }
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
    );
  }
}


