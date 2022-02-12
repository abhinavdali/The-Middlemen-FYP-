import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

class DriverProfile extends StatelessWidget {
  const DriverProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: BottomNavAppBar(
        title: 'Profile',
      ),
      body: DriverProfileContent(),
    );
  }
}

class DriverProfileContent extends StatefulWidget {
  const DriverProfileContent({Key? key}) : super(key: key);

  @override
  _DriverProfileContentState createState() => _DriverProfileContentState();
}

class _DriverProfileContentState extends State<DriverProfileContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          boxShadowBlue,
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  child: Image.asset('assets/Profile/profileimg.png'),
                                ),
                                const SizedBox(width: 16,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('John Doe',style: kStyleNormal.copyWith(
                                          color: Color(0xff1285E3)),),
                                      const SizedBox(height: 8,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          const Icon(Icons.email_outlined,color: Color(0xff1B9AFA),
                                            size: 20,),
                                          const SizedBox(width: 4,),
                                          Expanded(
                                            child: Text('johndoe@gmail.com',style: kStyleNormal.copyWith(
                                                color: const Color(0xff292929),
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 8,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.phone_outlined,color: Color(0xff1B9AFA),
                                            size: 20,),
                                          const SizedBox(width: 4,),
                                          Text('9876543210',style: kStyleNormal.copyWith(
                                              color: const Color(0xff292929),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),)
                                        ],
                                      ),
                                    ],
                                  ),
                                )
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
            Row(
              children: [
                Expanded(child: profileContent(icon: 'assets/DriverProfile/license.png',desc: 'License no.',value: '01-06-00816317',)),
              ],
            ),
            Row(
              children: [
                Expanded(child: profileContent(icon: 'assets/DriverProfile/vehicleno.png',desc: 'Vehicle no.',value: 'State 2-B DE 1234',)),
              ],
            ),
            Row(
              children: [
                Expanded(child: profileContent(icon: 'assets/DriverProfile/passwordlock.png',desc: 'Password',value: '*********',)),
              ],
            ),
            const SizedBox(height: 12,),
            const ArrowButton(
              text: 'LOGOUT',
              color: Color(0xffFF3D3D),
              arrow: 'assets/Profile/forwardarrowred.png',
            )
          ],
        ),
      ),
    );
  }
}
