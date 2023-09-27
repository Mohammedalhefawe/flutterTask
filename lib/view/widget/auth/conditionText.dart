import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';


class ConditionText extends StatelessWidget {
  const ConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'متابعتك تعني موافقتك على ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.sp,
                    fontFamily: 'Tajawal'),
              ),
              Text(
                'الشروط والأحكام',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 11.sp,
                  fontFamily: 'Tajawal',
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          Text(
            'الشروط والأحكام',
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 11.sp,
              fontFamily: 'Tajawal',
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
