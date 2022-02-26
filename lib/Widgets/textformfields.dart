import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';

class BlueTextFormField extends StatelessWidget {
  BlueTextFormField(
      this.hintText, this.icon, this.nameController, this.validator);

  final nameController;
  final hintText;
  final icon;
  final validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      validator: validator,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: Color(0xff777777),
      ),
      decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: kStyleAppColor,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: kStyleAppColor,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: kStyleAppColor,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff777777),
          ),
          contentPadding: EdgeInsets.fromLTRB(8, 8, 16, 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Icon(
              icon,
              size: 22,
              color: kStyleAppColor,
            ),
          )),
    );
  }
}

class TrackingFormField extends StatelessWidget {
  TrackingFormField(
      this.hintText, this.icon, this.nameController, this.validator);

  final nameController;
  final hintText;
  final icon;
  final validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      validator: validator,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xff777777),
      ),
      decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.black
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff777777),
          ),
          contentPadding: EdgeInsets.fromLTRB(8, 8, 16, 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Icon(
              icon,
              size: 22,
              color: Colors.black,
            ),
          )),
    );
  }
}

class PasswordTextFormField extends StatelessWidget {

  const PasswordTextFormField({
    Key? key,
    required this.passController,
    required this.isHiddenPassword,
    required this.icon

  }) : super(key: key);


  final TextEditingController passController;
  final isHiddenPassword;
  final IconButton icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passController,
      style: const TextStyle(
        fontFamily: 'Lato',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xff777777),
      ),
      obscureText: isHiddenPassword,
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: InputBorder.none,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: kStyleAppColor,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: kStyleAppColor,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: kStyleAppColor,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        hintText: 'Password',
        hintStyle: const TextStyle(
          fontFamily: 'NutinoSansReg',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xff777777),
        ),
        contentPadding:
        const EdgeInsets.fromLTRB(8, 16, 0, 0),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(
              left: 20, right: 12),
          child: Icon(Icons.lock_outlined,color: kStyleAppColor,),
        ),
        suffixIcon: Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 17),
            child: icon
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "This field is required";
        }
        return null;
      },
    );
  }
}

class BlueTextFormFieldPN extends StatelessWidget {
  BlueTextFormFieldPN(
      this.hintText, this.icon, this.nameController, this.validator);

  final nameController;
  final hintText;
  final icon;
  final validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
      controller: nameController,
      validator: validator,
      autocorrect: false,
      keyboardType: TextInputType.phone,
      style: const TextStyle(
        fontFamily: 'NutinoSansReg',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xff777777),
      ),
      decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: kStyleAppColor,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: kStyleAppColor,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: kStyleAppColor,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'NutinoSansReg',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff777777),
          ),
          contentPadding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Image.asset(
              icon,
              width: 20,
              color: kStyleAppColor,
            ),
          )),
    );
  }
}

