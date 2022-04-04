import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/driver_orders.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: BottomNavAppBar(
        title: 'Orders',
      ),
      body: DriverHomeContent(),
    );
  }
}

class DriverHomeContent extends StatefulWidget {
  const DriverHomeContent({Key? key}) : super(key: key);

  @override
  _DriverHomeContentState createState() => _DriverHomeContentState();
}

class _DriverHomeContentState extends State<DriverHomeContent> {
  late GoogleMapController mapController;

  late Position _currentPosition;

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
                color: Color(0xffF5FCFF),
                height: double.infinity,
                width: double.infinity,
                child: SafeArea(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: Offset(0, 3))
                              ]),
                          child: TabBar(
                              isScrollable: true,
                              unselectedLabelStyle: TabText,
                              indicator: BoxDecoration(
                                  color: kStyleAppColor,
                                  borderRadius: BorderRadius.circular(4)),
                              labelColor: Colors.white,
                              labelStyle: TabText,
                              unselectedLabelColor: kStyleAppColor,
                              // Tabbar tabs
                              tabs: [
                                TabBarTabs(
                                  text: 'Pending', image: null,
                                ),
                                TabBarTabs(text: 'Delivered', image: null,)
                              ]),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TabBarView(
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: 4,
                                  itemBuilder: (BuildContext context,
                                      int index){
                                    return pendingOrder(name: 'John Doe', location: 'Gwarko,Lalitpur');
                                  }
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: 4,
                                  itemBuilder: (BuildContext context,
                                      int index){
                                    return pendingOrder(name: 'John Doe', location: 'Gwarko,Lalitpur');
                                  }
                              ),
                              // ElevatedButton(onPressed: (){
                              //   _getCurrentLocation();
                              // }, child: Text('Check'))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
  }
}
