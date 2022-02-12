import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';

class BottomNavAppBar extends StatelessWidget with PreferredSizeWidget {
  BottomNavAppBar({required this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      title: Text(
        title,
        style: kStyleButton.copyWith(
            fontWeight: FontWeight.w400, fontSize: 14.sp),
      ),
      /* toolbarHeight: 60,*/
      titleSpacing: 16,
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}