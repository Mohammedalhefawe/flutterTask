import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomMaterialButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomMaterialButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 100.w,
      height: 6.h,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      onPressed: onPressed,
      color: const Color(0xff272739),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 15.sp,
            fontFamily: 'Tajawal'),
      ),
    );
  }
}
