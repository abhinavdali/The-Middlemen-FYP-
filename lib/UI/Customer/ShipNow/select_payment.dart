import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_package_option.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/tracking_label.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

class SelectPayment extends StatefulWidget {
  const SelectPayment({Key? key}) : super(key: key);

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  List _selectedIndexs = [];

  List<String> images = [
    'assets/ShipNow/cod.png',
    'assets/ShipNow/khalti.png'
  ];

  List<String> name = [
    'Cash on Delivery',
    'Khalti'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ship Now',),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
            child: Column(children: [
              Text(
                'Step 4 of 5',
                style: kStyleTitle,
              ),
              const SizedBox32(),
              Text(
                'Just one more step before you confirm your order!\nPlease select your payment method',
                style: kStyleTitle.copyWith(fontSize: 12.sp, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox16(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.37,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, i) {
                      final _isSelected = _selectedIndexs.contains(i);
                      return PaymentOptions(
                        icon: images[i],
                        name: name[i],
                        onTap: () {
                          setState(
                            () {
                              if (_isSelected) {
                                _selectedIndexs.remove(i);
                              } else if (_selectedIndexs.length > 0) {
                                _selectedIndexs.clear();
                                _selectedIndexs.add(i);
                              } else {
                                _selectedIndexs.add(i);
                              }
                            },
                          );
                        },
                        isSelected: _isSelected,
                      );
                    }),

                //     PaymentOptions(
                //       icon: 'assets/ShipNow/khalti.png',
                //       name: 'Khalti',)
                //   ],
                // ),
              )
            ]),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.15.sp,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousBtn(() {
              Navigator.of(context).pushReplacement(CustomPageRoute(child: SelectPackage(),direction: AxisDirection.right));
            }),
            if(_selectedIndexs.isNotEmpty)
            NextBtn(() {
              Navigator.of(context).pushReplacement(CustomPageRoute(child: TrackingLabel()));
            }),
          ],
        ),
      ),
    );
  }
}

class PaymentOptions extends StatelessWidget {
  PaymentOptions({required this.icon, required this.name, required this.onTap,required this.isSelected});

  final icon;
  final name;
  final onTap;
  final isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [boxShadowBlue]),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 23,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: kStyleNormal,
                  ),
                  Icon(
                    isSelected? Icons.check_circle : Icons.circle,
                    color: isSelected ? Colors.blue : Color(0xFFA3A3A3),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
