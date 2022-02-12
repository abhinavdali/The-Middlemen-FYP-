import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';

class TabBarTabs extends StatelessWidget {
  String text;
  final image;

  TabBarTabs({required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Padding(
        padding: EdgeInsets.only(
            left: 8, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(image),
            const SizedBox(width: 6,),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }
}

//For Profile Items
class ContainItems extends StatelessWidget {
  const ContainItems(
      {Key? key,
        required this.image,
        required this.label,
        required this.containerDesignType,
        required this.onTap})
      : super(key: key);

  final image;
  final label;
  final containerDesignType;
  final onTap;

  final kRadius = const Radius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            containerDesignType == "bottom" ? boxShadow : const BoxShadow(),
          ],
          borderRadius: containerDesignType == "top"
              ? BorderRadius.only(topLeft: kRadius, topRight: kRadius)
              : containerDesignType == "bottom"
              ? BorderRadius.only(bottomLeft: kRadius, bottomRight: kRadius)
              : containerDesignType == "both"
              ? const BorderRadius.all(Radius.circular(0.0))
              : const BorderRadius.all(Radius.circular(0.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(height: 22, width: 22, child: Image.asset(image)),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    label,
                    style: kStyleButton.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: 22,
                  width: 22,
                  child: Image.asset('assets/Profile/forwardarrow.png'))
            ],
          ),
        ),
      ),
    );
  }
}

//Divider
Widget itemDivider() {
  return const SizedBox(
    width: double.infinity,
    height: 0,
    child: Divider(
      color: Color(0xffD8DDE0),
      thickness: 1,
    ),
  );
}