import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';


class AddImageWidget extends StatelessWidget {
  final void Function()? onTap;
  const AddImageWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18.h,
      child: DottedBorder(
        color: const Color(0xffDADADA),
        strokeWidth: 1,
        dashPattern: const [8, 4],
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: onTap,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xffDADADA).withOpacity(0.4),
                  child: Icon(
                    Icons.add,
                    size: 20.sp,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'إضافة صورة',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                    fontSize: 14.sp,
                    fontFamily: 'Tajawal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
