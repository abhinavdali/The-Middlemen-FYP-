import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Select%20User/select_user.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

class CusProfile extends StatelessWidget {
  const CusProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: BottomNavAppBar(
        title: 'Profile',
      ),
      body: const CusProfileContent(),
    );
  }
}

class CusProfileContent extends StatefulWidget {
  const CusProfileContent({Key? key}) : super(key: key);

  @override
  _CusProfileContentState createState() => _CusProfileContentState();
}

class _CusProfileContentState extends State<CusProfileContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 34.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Profile Picture
                    Image.asset(
                      'assets/Profile/profileimg.png',
                      height: 75,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    //Profile Details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jane Doe',
                          style: kStyleNormal.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff444647)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'No. 123, Sub Street',
                          style: kStyleButton,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        //Edit Button
                        const EditProfileButton(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Profile Menu Items
          Padding(
            padding: const EdgeInsets.only(top: 33.0, bottom: 24),
            child: Column(
              children: [
                ContentItems(
                  onTap: () {
                  },
                  image: 'assets/Profile/menu.png',
                  label: 'My Orders List',
                  containerDesignType: 'top',
                ),
                itemDivider(),
                ContentItems(
                  onTap: () {},
                  image: 'assets/Profile/shipment.png',
                  label: 'Shipments',
                  containerDesignType: 'both',
                ),
                itemDivider(),
                ContentItems(
                    onTap: () {},
                    image: 'assets/Profile/invfrens.png',
                    label: 'Invite Friends',
                    containerDesignType: 'bottom'),
              ],
            ),
          ),

          ArrowButton(
            text: 'LOGOUT',
            color: Color(0xffFF3D3D),
            onPress: ()async{
              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.remove('username');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SelectUser();}));
            },
            arrow: 'assets/Profile/forwardarrowred.png',
          )
        ],
      ),
    );
  }
}