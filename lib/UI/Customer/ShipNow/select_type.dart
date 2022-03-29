import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_destination.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

class SelectType extends StatefulWidget {
  const SelectType({Key? key}) : super(key: key);

  @override
  State<SelectType> createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  String? _weightChoose = 'Select weight';
  String? _sizeChoose = 'Select size';

  List<String> weight = [
    'Select weight',
    'Less than 1 kg',
    '1-4 kg',
    '5-9 kg',
    '10-19 kg',
    '20-49 kg',
    '50-99 kg',
    '100+ kg',
  ];
  List<String> size = [
    'Select size',
    'Less than 1 m',
    '1-4 m',
    '4-9 m',
    '10-15 m',
  ];

  List<String> type = ['Documents', 'Parcel'];

  List<String> typeImg = ['assets/ShipNow/mail.png', 'assets/ShipNow/parcel.png'];

  final List _selectedType = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Ship Now',
      ),
      body: ListView(
        children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Step 1 of 6',
                    style: kStyleTitle,
                  ),
                  const SizedBox16(),
                  Text(
                    'What are you Sending?\nPlease select your package type',
                    style: kStyleTitle.copyWith(fontSize: 12.sp),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox16(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.34,
                    //Select Parcel Type
                    child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          final _isSelectedParcelType = _selectedType.contains(index);
                          return SelectTypeContainer(
                              type: type[index],
                              image: typeImg[index],
                              onPress: () {
                                setState(
                                      () {
                                    if (_isSelectedParcelType) {
                                      _selectedType.remove(index);
                                    } else if (_selectedType.isNotEmpty) {
                                      _selectedType.clear();
                                      _selectedType.add(index);
                                    } else {
                                      _selectedType.add(index);
                                    }
                                  },
                                );
                              },
                            isSelected: _isSelectedParcelType,
                          );
                        }),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Divider(
                      thickness: 0.7,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox16(),
                  Text(
                    'What is your package weight?',
                    style: kStyleTitle.copyWith(fontSize: 12.sp),
                  ),
                  // SizedBox16(),
                  // Image.asset('assets/ShipNow/weight.png'),
                  const SizedBox16(),
                  //Dropdown menus to select size and weight
                  Column(
                    children: [
                      DropDown(weight: weight, weightChoose: _weightChoose,onTap: (item) {
                        setState(() {
                          _weightChoose = item as String?;
                        });
                      },),
                      DropDown(weight: size, weightChoose: _sizeChoose,onTap: (item) {
                        setState(() {
                          _sizeChoose = item as String?;
                        });
                      },)
                    ],
                  )
                ],
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.15.sp,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if(_selectedType.isNotEmpty && _weightChoose != 'Select weight' && _sizeChoose != 'Select size')
            NextBtn(()
            {
              context.read<DataProvider>().partype(_selectedType, _weightChoose,_sizeChoose);
              Navigator.of(context).pushReplacement(CustomPageRoute(child: SelectDestination()));
            }),
          ],
        ),
      ),
    );
  }
}


