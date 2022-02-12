import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/show_dialog.dart';

class CusSettings extends StatelessWidget {
  const CusSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kStyleBackground,
      appBar: BottomNavAppBar(
        title: 'Settings',
      ),
      body: CusSettingsContent(),
    );
  }
}



class CusSettingsContent extends StatefulWidget {
  const CusSettingsContent({Key? key}) : super(key: key);

  @override
  _CusSettingsContentState createState() => _CusSettingsContentState();
}

class _CusSettingsContentState extends State<CusSettingsContent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
            children: [
              ContentItems(
                onTap: () {},
                image: 'assets/Settings/shipping.png',
                label: 'Shipping Address',
                containerDesignType: 'top',
              ),
              itemDivider(),
              ContentItems(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return Profile();
                  // }));
                },
                image: 'assets/Settings/payment.png',
                label: 'Payment Method',
                containerDesignType: 'both',
              ),
              itemDivider(),
              ContentItems(
                onTap: () {},
                image: 'assets/Settings/language.png',
                label: 'Language',
                containerDesignType: 'bottom',
              ),
              const SizedBox(
                height: 16,
              ),
              ContentItems(
                onTap: () {},
                image: 'assets/Settings/notification.png',
                label: 'Notification Profile',
                containerDesignType: 'top',
              ),
              itemDivider(),
              ContentItems(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return FAQ();
                  // }));
                },
                image: 'assets/Settings/faq.png',
                label: 'FAQ',
                containerDesignType: 'both',
              ),
              itemDivider(),
              ContentItems(
                onTap: () {
                  showFeedbackDialog(context);
                },
                image: 'assets/Settings/rateus.png',
                label: 'Rate Us',
                containerDesignType: 'both',
              ),
              itemDivider(),
              ContentItems(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return Privacy();
                  // }));
                },
                image: 'assets/Settings/privacy.png',
                label: 'Privacy Policy',
                containerDesignType: 'both',
              ),
              itemDivider(),
              ContentItems(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return TermsAndCondition();
                  // }));
                },
                image: 'assets/Settings/terms.png',
                label: 'Terms and Conditions',
                containerDesignType: 'bottom',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
