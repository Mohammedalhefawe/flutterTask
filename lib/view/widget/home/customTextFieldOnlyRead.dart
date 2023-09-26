import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomTextFieldOnlyRead extends StatelessWidget {
  final String hint;
  final String suffix;
  final String imageUrl;
  const CustomTextFieldOnlyRead(
      {super.key,
      required this.hint,
      required this.suffix,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 100.w,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xffDADADA)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imageUrl,
                height: 1.8.h,
                width: 1.8.h,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                hint,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff272739),
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            suffix,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 10.sp,
                color: AppColor.primaryColor,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
