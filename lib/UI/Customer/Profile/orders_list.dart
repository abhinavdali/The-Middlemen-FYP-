import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Customer%20Models/view_shipment.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/Widgets/appbars.dart';

class OrderLists extends StatefulWidget {
  const OrderLists({Key? key}) : super(key: key);

  @override
  State<OrderLists> createState() => _OrderListsState();
}

class _OrderListsState extends State<OrderLists> {
  late String token =
      Provider.of<DataProvider>(context, listen: false).token;

  Future<ViewShipment?>? _viewShip;
  Future<ViewShipment?> getShipmentDetails() async{
    ViewShipment? list = await NetworkHelper().getViewShipmentData(token);
    return  list;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewShip = getShipmentDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'My Orders List',
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                Text('View Your Orders List',style: kStyleTitle,textAlign: TextAlign.center,),
                const SizedBox(
                  height: 24,
                ),
                Image.asset('assets/Profile/orders.png',height: 120,width: 120,),
                const SizedBox(
                  height: 24,
                ),
                FutureBuilder<ViewShipment?>(
                    future: _viewShip,
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        var def = snapshot.data?.data;
                        return Container(
                          padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 0),
                          decoration:  BoxDecoration(
                            color: kStyleAppColor,
                            boxShadow: [boxShadowBlue],
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                          ),
                          height: MediaQuery.of(context).size.height * 1,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount:def?.length,
                              itemBuilder: (context,index){
                                return Container(
                                  margin: const EdgeInsets.all(12),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: kStyleBackground,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [boxShadowBlue],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${def?[index]?.trackingNumber}'),
                                      Text('Receiver: '),
                                      const SizedBox16(),
                                      Row(
                                        children: [
                                          Text('From: '),
                                          Text('To: ')
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                        );
                      }else{
                        return const Center(child: CircularProgressIndicator(),);
                      }
                })
              ]
            ),
          ),
        ],
      ),
    );
  }
}
