import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/BottomNavBar/bottom_nav_cus.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/mobile_save_pdf.dart';

class TrackingLabel extends StatefulWidget {
  TrackingLabel({required this.id,required this.type, required this.weight, required this.size, required this.package_type, required this.rname, required this.rphone, required this.remail, required this.start, required this.dest, required this.status,required this.price, required this.payment, required this.trackingid, required this.deliveryDate});
  final id,type,weight,size,package_type,rname,rphone,remail,start,dest,status,price,payment,trackingid,deliveryDate;

  @override
  State<TrackingLabel> createState() => _TrackingLabelState();
}

class _TrackingLabelState extends State<TrackingLabel> {
  late String fName =
      Provider.of<DataProvider>(context, listen: false).fName;
  late String lName =
      Provider.of<DataProvider>(context, listen: false).lName;
  late String phoneNumber =
      Provider.of<DataProvider>(context, listen: false).phoneNumber;

  Future<Uint8List> _readImageData(String name) async{
    final data = await rootBundle.load(name);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<void> _createPDF() async{

    PdfDocument doc = PdfDocument();
    final page = doc.pages.add();

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
      font: PdfStandardFont(PdfFontFamily.helvetica, 18 ),
      cellPadding: PdfPaddings(left: 5,right: 2,bottom: 2,top: 2)
    );

    // page.graphics.drawImage(PdfBitmap(await _readImageData('${QrImage(data: widget.trackingid ,version: QrVersions.auto,size: 200,)}')), Rect.fromLTWH(0, 100, 400, 400));


    grid.columns.add(count: 2);

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = 'FROM: $fName $lName\n$phoneNumber\n${widget.start}';
    row.cells[1].value = 'SHIP DATE: ${widget.deliveryDate}\nWEIGHT: ${widget.weight}\nDIMMENSION: ${widget.size}';

    row = grid.rows.add();
    row.cells[0].value = 'TO: ${widget.rname}\n${widget.rphone}\n\n${widget.dest}\n ';

    row = grid.rows.add();


    grid.draw(page: page,bounds: const Rect.fromLTWH(0,0,0,0));

    List<int> bytes = doc.save();
    doc.dispose();

    saveAndLauchFile(bytes, "Tracking Label");
  }







  @override
  Widget build(BuildContext context) {
    var data = [
    ["FROM: $fName $lName\n$phoneNumber\n${widget.start}","SHIP DATE: ${widget.deliveryDate}\nWEIGHT: ${widget.weight}\nDIMMENSION: ${widget.size}"],
      ["TO: ${widget.rname}\n${widget.rphone}\n\n${widget.dest}\n"],
      ["TRACKING NUMBER: ${widget.trackingid}"]
    ];
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Ship Now',),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 24),
            child: Column(
              children: [
                Text('Step 6 of 6 ',style: kStyleTitle,),
                const SizedBox16(),
                Text('View your Shipping Label',style: kStyleNormal,),
                const SizedBox16(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // QrImage(data: widget.trackingid ,version: QrVersions.auto,size: 200,),
                    ElevatedButton(
                        onPressed: ()async{
                          final pdfFile = await PdfApi.generatePdf("Tracking Label",data,widget.trackingid);
                        },
                        child: Text('Show in PDF')),
                  ],
                ),
                const SizedBox16(),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kStyleAppColor,
                    boxShadow: [boxShadowBlue],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      ShippingDetails(label: 'Shipping ID :',value: '${widget.id}'),
                      itemDivider(),
                      ShippingDetails(label: 'Type :',value: widget.type),
                      itemDivider(),
                      ShippingDetails(label: 'Weight :',value: widget.weight),
                      itemDivider(),
                      ShippingDetails(label: 'Size :',value: widget.size),
                      itemDivider(),
                      ShippingDetails(label: 'Package Type :',value: widget.package_type),
                      itemDivider(),
                      ShippingDetails(label: 'Receiver\'s Name :',value: widget.rname),
                      itemDivider(),
                      ShippingDetails(label: 'Receiver\'s Phone Number :',value: widget.rphone),
                      itemDivider(),
                      ShippingDetails(label: 'Receiver\'s Email :',value: widget.remail),
                      itemDivider(),
                      ShippingDetails(label: 'Start :',value: widget.start),
                      itemDivider(),
                      ShippingDetails(label: 'Destination :',value: widget.dest),
                      itemDivider(),
                      ShippingDetails(label: 'Status :',value: widget.status),
                      itemDivider(),
                      ShippingDetails(label: 'Delivery Date :',value: widget.deliveryDate),
                      itemDivider(),
                      ShippingDetails(label: 'Price :',value: 'Rs. ${widget.price}'),
                      itemDivider(),
                      ShippingDetails(label: 'Payment Method :',value: widget.payment),
                      itemDivider(),
                      ShippingDetails(label: 'Tracking ID :',value: '${widget.trackingid}'),
                    ],
                  ),
                ),
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            NextBtn(() {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return BottomNavigationCus();}));
            },'Finish'),
          ],
        ),
      ),
    );
  }
}


class ShippingDetails extends StatelessWidget {
  ShippingDetails({required this.label,required this.value});
  final label;
  final value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label,style: kStyleNormal,)),
          Expanded(child: Text(value,style: kStyleNormal,)),
        ],
      ),
    );
  }
}