import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Driver%20Models/shipment_list.dart';
import 'package:the_middlemen/Models/Driver%20Models/shipment_update.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/tracking_label.dart';
import 'package:the_middlemen/UI/Driver/BottomNavBar/bottom_nav_driver.dart';
import 'package:the_middlemen/UI/Driver/Home/driver_home/driver_home.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/show_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class AvailableOrders extends StatefulWidget {
  AvailableOrders({required this.code});
  final code;

  @override
  _AvailableOrdersState createState() => _AvailableOrdersState();
}


class _AvailableOrdersState extends State<AvailableOrders> {
  late String token =
      Provider.of<DataProvider>(context, listen: false).token;

  Future<ShipmentList?>? _shipmentList;
  Future<ShipmentList?> getShipmentDetails() async{
    ShipmentList? list = await NetworkHelper().getShipmentList(token);
    return  list;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _shipmentList = getShipmentDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Available Order',),
      body: FutureBuilder<ShipmentList?>(
          future: _shipmentList,
          builder: (context,snapshot){
            if(snapshot.hasData){
              var def = snapshot.data?.data;
              var data = def?.where((element) => element?.trackingNumber == widget.code);
              var price = data?.map((e) => e?.price).toString().replaceAll('(', '').replaceAll(')', '');
              var rname = data?.map((e) => e?.receiver).toString().replaceAll('(', '').replaceAll(')', '');
              var id = data?.map((e) => e?.id).toString().replaceAll('(', '').replaceAll(')', '');
              var rphone = data?.map((e) => e?.phoneNumber).toString().replaceAll('(', '').replaceAll(')', '');
              var remail = data?.map((e) => e?.email).toString().replaceAll('(', '').replaceAll(')', '');
              var ofType = data?.map((e) => e?.ofType).toString().replaceAll('(', '').replaceAll(')', '');
              var weight = data?.map((e) => e?.weight).toString().replaceAll('(', '').replaceAll(')', '');
              var size = data?.map((e) => e?.size).toString().replaceAll('(', '').replaceAll(')', '');
              var package = data?.map((e) => e?.packageType).toString().replaceAll('(', '').replaceAll(')', '');
              var payment = data?.map((e) => e?.paymentType).toString().replaceAll('(', '').replaceAll(')', '');
              var start = data?.map((e) => e?.start).toString().replaceAll('(', '').replaceAll(')', '');
              var dest = data?.map((e) => e?.destination).toString().replaceAll('(', '').replaceAll(')', '');
              var deliveryDate = data?.map((e) => e?.deliveryDate).toString().replaceAll('(', '').replaceAll(')', '');

              return Container(
                height: double.infinity,
                width: double.infinity,
                color: const Color(0xffF5FCFF),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
                  child: ListView(
                    children: [
                      // Order Number
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order No. $id'),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                border: Border.all(width: 2, color: Color(0xff1285E3))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.01, horizontal: 8.05),
                              child: Text(
                                payment == 'eSewa' ? 'Paid':'Pending',
                                style: kStyleTitle.copyWith(
                                  fontSize: 14,
                                  color:   payment == 'eSewa' ? Color(0xff4FC72E) :Color(0xff1285E3),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Scheduled Date
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$deliveryDate',
                              style: kStyleNormal.copyWith(
                                  color: const Color(0xff76A063), fontSize: 14),
                            ),
                            Text('$payment',
                                style: kStyleNormal.copyWith(
                                    color: const Color(0xff76A063), fontSize: 14))
                          ],
                        ),
                      ),
                      // Receiver Details and Navigator
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    boxShadowBlue,
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 31,
                                                backgroundColor: Colors.grey,
                                                child: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    radius: 30,
                                                    child: Image.asset(ofType == 'parcel'? 'assets/ShipNow/parcel.png': 'assets/ShipNow/mail.png',height: 40,width: 40,)),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Package Details',style: kStyleTitle.copyWith(fontSize: 12.sp),),
                                                  const SizedBox(height: 8,),
                                                  packageDetails(title: 'Package Type:  ',value: package,),
                                                  const SizedBox(height: 8,),
                                                  packageDetails(title: 'Weight:  ',value: '$weight kg',),
                                                  const SizedBox(height: 8,),
                                                  packageDetails(title: 'Dimensional Weight:  ',value: '$size kg',),
                                                  const SizedBox(height: 8,),
                                                  packageDetails(title: 'Price:  ',value: 'Rs. $price',),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox16(),
                                          itemDivider(),
                                          const SizedBox16(),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                child: Image.asset('assets/Profile/profile.png'),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    // Name
                                                    Text(
                                                      '$rname',
                                                      style: kStyleNormal.copyWith(
                                                          color: Color(0xff1285E3)),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    // Address
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on,
                                                          color: Color(0xff1B9AFA),
                                                          size: 20,
                                                        ),
                                                        const SizedBox(width: 8,),
                                                        Expanded(
                                                            child: Text(
                                                              '$dest',
                                                              style: kStyleNormal.copyWith(
                                                                  color: Color(0xff292929),
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w400),
                                                            ))
                                                      ],
                                                    ),
                                                    const SizedBox(height: 4,),

                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        const Icon(
                                                          Icons.email,
                                                          color: Color(0xff1B9AFA),
                                                          size: 20,
                                                        ),
                                                        const SizedBox(width: 8,),
                                                        Expanded(
                                                            child: Text(
                                                              '$remail',
                                                              style: kStyleNormal.copyWith(
                                                                  color: Color(0xff292929),
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w400),
                                                            ))
                                                      ],
                                                    ),
                                                    const SizedBox(height: 4,),
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        const Icon(
                                                          Icons.phone,
                                                          color: Color(0xff1B9AFA),
                                                          size: 20,
                                                        ),
                                                        const SizedBox(width: 8,),
                                                        Expanded(
                                                            child: Text(
                                                              '$rphone',
                                                              style: kStyleNormal.copyWith(
                                                                  color: Color(0xff292929),
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w400),
                                                            ))
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(top: 16.0),
                                                      child: Row(
                                                        children: [
                                                          CallButton(onPress: (){
                                                            var phone = rphone;
                                                            launch('tel://$phone');
                                                          },),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox16(),

                      ArrowButton(
                          text: 'BEGIN SHIPMENT',
                          color: const Color(0xff00A6FB),
                          onPress: (){
                            showDialog(barrierColor: Colors.blueAccent.withOpacity(0.3),
                                barrierDismissible: false,
                                context: context,
                                builder: (_) => Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      height: MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(16)
                                      ),
                                      child: Column(
                                        children: [
                                          Text('Begin Shipment?',style: kStyleNormal,),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              dialogButton(tn: 'tn', onTap: ()async{
                                                ShipmentUpdate update = await NetworkHelper().shipmentUpdate(widget.code, token);
                                                if(update.data !=  null ) {
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return BottomNavigationDriver();}));
                                                }
                                              }, text: 'Yes', color: Colors.green),
                                              dialogButton(tn: 'tn', onTap: (){
                                                Navigator.pop(context);
                                              }, text: 'No', color: Colors.red),
                                            ],
                                          )
                                        ],
                                      )
                                    )
                                  ],));
                          },
                          arrow: 'assets/Profile/buttonarrow.png'),
                    ],
                  ),
                ),
              );
            }else{
              return Center(child: Column(
                children: [
                  Image.asset('assets/UserType/loading.gif',width: 120,height: 120,),
                  Text('Please Wait',style: kStyleNormal,)
                ],
              ),);
            }
          }),
    );
  }
}

class packageDetails extends StatelessWidget {
  packageDetails({required this.title,required this.value});

  final title;
  final value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(title,style: kStyleNormal.copyWith(
            color: const Color(0xff292929),
            fontSize: 14,
            fontWeight: FontWeight.w400),),
        Text(value,style: kStyleNormal.copyWith(
            color: const Color(0xff292929),
            fontSize: 14,
            fontWeight: FontWeight.w400),)
      ],
    );
  }
}
