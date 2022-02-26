import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';

class pendingOrder extends StatelessWidget {
  pendingOrder({required this.name, required this.location,});

  final name;
  final location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: kStyleAppColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    boxShadowBlue
                  ]),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Image.asset('assets/Profile/profileimg.png'),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: kStyleNormal.copyWith(
                                      color: Color(0xff252627),
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: kStyleContainer,
                                      size: 16,
                                    ),
                                    Expanded(
                                        child: Text(
                                          location,
                                          style: kStyleNormal.copyWith(
                                              color: Color(0xff71777C),
                                              fontSize: 13,
                                              letterSpacing: 0.8),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: kStyleContainer,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}