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
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

//For Profile Items
class ContentItems extends StatelessWidget {
  const ContentItems(
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
          color: kStyleContainer,
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
                  SizedBox(height: 22, width: 22, child: Image.asset(image,color: Colors.black,)),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    label,
                    style: kStyleButton.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colors.black
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
      color: Colors.black,
      thickness: 1,
    ),
  );
}

//Features Container (Home Page)
class Features extends StatelessWidget {
  Features({required this.icon,required this.text,required this.onPress});

  final icon;
  final text;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 165,
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: kStyleContainer,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [boxShadow]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(height: 8,),
            Text(text,style: kStyleTitle.copyWith(fontSize: 13.sp),)
          ],
        ),
      ),
    );
  }
}

//Driver Profile Content
class profileContent extends StatelessWidget {
  profileContent({required this.icon,required this.desc,required this.value});
  final icon;
  final desc;
  final value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: kStyleAppColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            boxShadowBlue,
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 21,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                child: Image(image: AssetImage(icon),color: Colors.black,width: 20,height: 20,),
                backgroundColor: Colors.white,
                radius: 20,
              ),
            ),
            const SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(desc,style: kStyleNormal.copyWith(fontWeight: FontWeight.w500,),),
                SizedBox(height: 4,),
                Text(value,style: kStyleNormal.copyWith(color: const Color(0xff71777C),fontSize: 12,fontWeight: FontWeight.w400),)
              ],
            )
          ],
        ),
      ),
    );
  }
}