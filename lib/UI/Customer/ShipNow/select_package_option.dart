import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_destination.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_payment.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

class SelectPackage extends StatefulWidget {
  const SelectPackage({Key? key}) : super(key: key);

  @override
  State<SelectPackage> createState() => _SelectPackageState();
}

class _SelectPackageState extends State<SelectPackage> {
  List<String> packageIcon = [
    'assets/ShipNow/express.png',
    'assets/ShipNow/normal.png',
    'assets/ShipNow/cheap.png'
  ];

  List<String> title = [
    'Express Package',
    'Normal Package',
    'Cheap Package'
  ];

  List<String> desc = [
    'Express Package',
    'Normal Package',
    'Cheap Package'
  ];

  List _selectedIndexs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ship Now',),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 24),
            child: Column(
              children: [
                Text('Step 3 of 5',style: kStyleTitle,),
                const SizedBox32(),
                Text('Please select your package type',style: kStyleTitle.copyWith(fontSize: 12.sp),textAlign: TextAlign.center,),
                const SizedBox16(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1.15,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        final _isSelected = _selectedIndexs.contains(index);
                        return PackageOption(
                          packageIcon: packageIcon[index],
                          onTap: () {
                              setState(
                                    () {
                                  if (_isSelected) {
                                    _selectedIndexs.remove(index);
                                  } else if (_selectedIndexs.isNotEmpty) {
                                    _selectedIndexs.clear();
                                    _selectedIndexs.add(index);
                                  } else {
                                    _selectedIndexs.add(index);
                                  }
                                },
                              );
                            },
                          isSelected: _isSelected,
                          title: title[index],
                          desc: desc[index],
                        );
                      }),
                )
              ],
            ),
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
              Navigator.of(context).pushReplacement(CustomPageRoute(child: SelectDestination(),direction: AxisDirection.right));
            }),
            if(_selectedIndexs.isNotEmpty)
            NextBtn(() {
              Navigator.of(context).pushReplacement(CustomPageRoute(child: SelectPayment()));
            }),
          ],
        ),
      ),
    );
  }
}

