import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';

class SelectUserButton extends StatelessWidget {
  const SelectUserButton({required this.text,required this.onPress,required this.color});

  final text;
  final onPress;
  final color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 49,
          width: 156,
          child: ElevatedButton(
            onPressed: onPress,
            child: Text(
              text,
              style: kStyleButton.copyWith(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)))),
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({required this.text,required this.onPress,required this.color});

  final text;
  final onPress;
  final color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          text,
          style: kStyleButton.copyWith(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)))),
      ),
    );
  }
}


class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return EditProfile();
        // }));
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Color(0xffBBBFC2)))),
      child: Text(
        'EDIT PROFILE',
        style: kStyleButton,
      ),
    );
  }
}

class ArrowButton extends StatelessWidget {
  const ArrowButton(
      {required this.text,
        required this.color,
        required this.onPress,
        required this.arrow});

  final text;
  final color;
  final onPress;
  final arrow;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 40.sp,
      child: ElevatedButton(
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 0,
            top: 8,
            bottom: 8,
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: kStyleButton.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    arrow,
                    /*         width: 35,
                    height: 35,*/
                  ),
                ],
              )
            ],
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)))),
      ),
    );
  }
}