import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_package_option.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_payment.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

class TrackingLabel extends StatefulWidget {
  const TrackingLabel({Key? key}) : super(key: key);

  @override
  State<TrackingLabel> createState() => _TrackingLabelState();
}

class _TrackingLabelState extends State<TrackingLabel> {
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
                Text('Step 6 of 6 ',style: kStyleTitle,),
                const SizedBox16(),
                Text('View your Shipping Label',style: kStyleNormal,)
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
              Navigator.of(context).pushReplacement(CustomPageRoute(child: SelectPayment(),direction: AxisDirection.right));
            }),
            NextBtn(() {
              // Navigator.of(context).push(CustomPageRoute(child: SelectPackage()));
            }),
          ],
        ),
      ),
    );
  }
}