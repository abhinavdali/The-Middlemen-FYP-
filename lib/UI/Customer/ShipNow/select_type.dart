import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';

class SelectType extends StatelessWidget {
  const SelectType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 0.5,color: kStyleAppColor),
                  ),
                  child: Center(child: const Text('Parcel')),
                ),
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 0.5,color: kStyleAppColor),
                  ),
                  child: Center(child: const Text('Letter')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
