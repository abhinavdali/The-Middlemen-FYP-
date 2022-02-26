import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class CusHome extends StatelessWidget {
  const CusHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: BottomNavAppBar(
        title: 'Home',
      ),
      body: CusHomeContent(),
    );
  }
}

class CusHomeContent extends StatefulWidget {
  const CusHomeContent({Key? key}) : super(key: key);

  @override
  _CusHomeContentState createState() => _CusHomeContentState();
}

class _CusHomeContentState extends State<CusHomeContent> {
  final TextEditingController trackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kStyleContainer,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [boxShadow]
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Welcome to ',
                          style: kStyleTitle,
                        ),
                        Text(
                          'The Middlemen!',
                          style: kStyleTitle
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'To track your package please enter your tracking number',
                      style: kStyleNormal.copyWith(letterSpacing: 1.5),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TrackingFormField('Enter your tracking number',
                        Icons.backpack_outlined, trackController, (String? value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    ArrowButton(text: 'TRACK NOW', color: const Color(0xff00A6FB),onPress: (){}, arrow: 'assets/Profile/buttonarrow.png')
                  ],
                ),
              ),
             const SizedBox(height: 80,),
             Column(
               children: [
                 Text(
                     'What are you looking for?',
                   style: kStyleTitle.copyWith(fontSize: 14.sp),
                 ),
                 const SizedBox(height: 16,),
                 Text(
                     'Here are our features',
                   style: kStyleNormal.copyWith(color: Colors.grey),
                 ),
                 const SizedBox(height: 24,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Features(icon: Icons.calculate_outlined,text: 'Calculate and ship packages',onPress: (){},),
                     Features(icon: Icons.receipt_outlined, text: 'Receive Packages',onPress: (){},)
                   ],
                 ),
                 const SizedBox(height: 16,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Features(icon: Icons.scanner_outlined,text: 'QR Scan to track packages',onPress: (){},),
                     Features(icon: Icons.receipt_outlined, text: 'Receive Packages',onPress: (){},)
                   ],
                 ),
               ],
             )
            ],
          ),
        )
      ],
    );
  }
}


