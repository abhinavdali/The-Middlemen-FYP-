
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return BackAppBar(
        title: 'Edit Profile',
        bodyPass: EditProfileContent(),
      );
  }
}

class EditProfileContent extends StatefulWidget {
  const EditProfileContent({Key? key}) : super(key: key);

  @override
  _EditProfileContentState createState() => _EditProfileContentState();
}

class _EditProfileContentState extends State<EditProfileContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
      child: ListView(
        children: [
          Column(
            children: [
              Image.asset(
                'assets/Profile/profileimg.png',
                height: 112,
                width: 112,
              ),
              SizedBox(
                height: 32,
              ),
              const TextFormFieldForLoginRegister(
                  label: 'Full Name',
                  imageName: 'assets/SignUp/personIcon.png',
                  textFieldDesignType:
                  "top" //provide textFieldNumber for customizing the textField),
              ),
              const TextFormFieldForLoginRegister(
                  label: 'Last Name',
                  imageName: 'assets/SignUp/personIcon.png',
                  textFieldDesignType:
                  "noRadius" //provide textFieldNumber for customizing the textField),
              ),
              const TextFormFieldForLoginRegister(
                  label: 'Phone',
                  imageName: 'assets/SignUp/phoneIcon.png',
                  textFieldDesignType:
                  "noRadius" //provide textFieldNumber for customizing the textField),
              ),
              const TextFormFieldForLoginRegister(
                  label: 'Email Address',
                  imageName: 'assets/SignUp/email.png',
                  textFieldDesignType:
                  "noRadius" //provide textFieldNumber for customizing the textField),
              ),
              const TextFormFieldForLoginRegister(
                  label: 'Address',
                  imageName: 'assets/SignUp/mapIcon.png',
                  textFieldDesignType:
                  "bottom" //provide textFieldNumber for customizing the textField),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 120.sp,
                child: ArrowButton(
                    text: 'Update',
                    color: Color(0xff00A6FB),
                    arrow: 'assets/Profile/buttonarrow.png', onPress: (){},),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
