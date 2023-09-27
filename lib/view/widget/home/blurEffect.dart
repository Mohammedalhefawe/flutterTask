import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/imgaeasset.dart';
import 'customMaterialButton.dart';

class BlurEffect extends StatelessWidget {
  final void Function()? onPressed;
  const BlurEffect({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 100.h,
      // Adjust the height as needed
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 4, sigmaY: 4), // Adjust the blur radius as needed
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 140,
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImageAsset.alert,
                          width: 40.w,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'طلبك قيد المراجعة\nسيتم اعلامك بالنتيجة',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xff272739),
                              fontSize: 13.sp,
                              fontFamily: 'Tajawal'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomMaterialButton(
                  onPressed: onPressed,
                  text: 'موافق',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
