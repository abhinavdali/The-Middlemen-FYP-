import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


const kStyleMainBlue = Color(0xFF00A6FB);
const kStyleBackground = Color(0xffF1F7FA);
const kStyleAppColor = Color(0xff00E7FD);


var kStyleButton = TextStyle(
  fontFamily: 'Lato',
  fontSize: 12.sp,
  color: Color(0xff444647),
  fontWeight: FontWeight.w300,
);


var kStyleTitle = TextStyle(
  fontFamily: 'Lato',
  fontSize: 16.sp,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

var kStyleNormal = TextStyle(
  fontFamily: 'Lato',
  fontSize: 12.sp,
  color: Colors.grey,
  fontWeight: FontWeight.w400
);

const TabText = const TextStyle(
  fontFamily: 'NunitoSans',
  fontSize: 14.4,
);

var boxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  blurRadius: 2.0, // soften the shadow
  offset: const Offset(
    0.0, // Move to right 10  horizontally
    2.0, // Move to bottom 10 Vertically
  ),
);