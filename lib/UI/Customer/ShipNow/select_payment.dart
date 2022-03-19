import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Customer%20Models/pricing.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/receiver_details.dart';
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
  final List _selectedIndexs = [];

  List<String> images = [
    'assets/ShipNow/cod.png',
    'assets/ShipNow/khalti.png'
  ];

  List<String> name = [
    'Cash on Delivery',
    'Khalti'
  ];
  late List parcelType =
      Provider.of<DataProvider>(context, listen: false).parcelType;
  late String weight =
      Provider.of<DataProvider>(context, listen: false).weightT;
  late String size =
      Provider.of<DataProvider>(context, listen: false).sizeT;
  
  //Function to differentiate parcel type
  parType(){
    var parcel;
    if(parcelType == [0]){
      parcel = 'Document';
    }else{
      parcel = 'parcel';
    }
    return parcel;
  }

  Future<Pricing?>? _pricing;
  Future<Pricing?> getPricing() async{
    Pricing? list = await NetworkHelper().getPricingData();
    return  list;
  }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pricing = getPricing();
  }

  @override
  Widget build(BuildContext context) {
    late List selectedPackage =
        Provider.of<DataProvider>(context, listen: false).pacType;
    late double distance =
        double.parse(Provider.of<DataProvider>(context, listen: false).dist);
    return Scaffold(
      appBar: CustomAppBar(title: 'Ship Now',),
      body: FutureBuilder<Pricing?>(
        future: _pricing,
        builder: (context,snapshot) {
          if(snapshot.hasData){
            var data = snapshot.data?.data?.where((element) => element?.weight == weight && element?.size == size && element?.typeOf == parType());
            var initprice = data?.map((e) => e?.price).toString().replaceAll('(', '').replaceAll(')', '');
            double price =  double.parse(initprice!);

            //Func to calculate package cost
            packageCost(){
              if(selectedPackage.contains(0)){
                  price = (price + ((20/100)*price));
              }
              else if(selectedPackage.contains(1)){
                  price = (price + ((5/100)*price));
              }
              else{
                price;
              }
              return price;
            }

            var distRate;
            distanceRate(){
              if(distance <= 5){
                distRate = 200;
              }else if (distance > 5 && distance <= 10){
                distRate = 400;
              }else if (distance > 10 && distance <= 20){
                distRate = 600;
              }else if (distance > 20 && distance <= 50){
                distRate = 1000;
              }else if (distance > 50 && distance <= 100){
                distRate = 1500;
              }else if (distance > 100){
                distRate = 2000;
              }
              return distRate;
            }
            var p = packageCost();
            var totalAmt;
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
                  child: Column(children: [
                    Text(
                      'Step 5 of 6',
                      style: kStyleTitle,
                    ),
                    const SizedBox32(),
                    Text(
                      'Just one more step before you confirm your order!',
                      style: kStyleTitle.copyWith(fontSize: 12.sp, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox16(),
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: MediaQuery.of(context).size.height * 0.17,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [boxShadowBlue],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          PricingContent(title: 'Price',amt: 'Rs. $initprice',titleStyle: kStyleNormal,amtStyle: kStyleNormal,),
                          const SizedBox8(),
                          PricingContent(title: 'Delivery Charge',amt: 'Rs. ${distanceRate()}',titleStyle: kStyleNormal,amtStyle: kStyleNormal),
                          const SizedBox8(),
                          PricingContent(title: 'Package Type',amt: 'Rs. $p',titleStyle: kStyleNormal,amtStyle: kStyleNormal),
                          const SizedBox8(),
                          PricingContent(title: 'Total Amount',amt: 'Rs. ${totalAmt = distanceRate() + p} ',titleStyle: kStyleNormal.copyWith(color: Colors.blue),amtStyle: kStyleNormal.copyWith(color: Colors.blue)),
                        ],
                      ),
                    ),
                    const SizedBox16(),
                    const Text('Please select your payment method'),
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
                                    } else if (_selectedIndexs.isNotEmpty) {
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
                    )
                  ]),
                )
              ],
            );
          }
          return const CircularProgressIndicator();

        }
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
              Navigator.of(context).pushReplacement(CustomPageRoute(child: ReceiverDetails(),direction: AxisDirection.right));
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


