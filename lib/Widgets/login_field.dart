import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/BottomNavBar/bottom_nav_cus.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

import 'buttons.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    Key? key,
    required this.emailController,required this.widget,required this.loginText,
    required this.onPress
  }) : super(key: key);

  final TextEditingController emailController;
  final widget;
  final loginText;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(loginText,style: kStyleTitle,),
              const SizedBox(height: 20,),
              BlueTextFormField(
                'Email',
                Icons.email_outlined,
                emailController,
                    (String? value) {
                  if (value!.isEmpty) {
                    return "This field is required";
                  }
                  if (!RegExp(
                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return "Please enter valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16,),
              widget,
              const SizedBox(height: 32,),
              LoginButton(text: 'LOGIN', onPress: onPress, color: kStyleAppColor)
            ],
          ),
        ),
      ],
    );
  }
}