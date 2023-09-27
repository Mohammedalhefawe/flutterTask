import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';


class RowForTowTextAndOnTap extends StatelessWidget {
  final void Function()? onTap;
  final String text1;
  final String text2;
  const RowForTowTextAndOnTap(
      {super.key, this.onTap, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 13.sp,
              fontFamily: 'Tajawal'),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 13.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
