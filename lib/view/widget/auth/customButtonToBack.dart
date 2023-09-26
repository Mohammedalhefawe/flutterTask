import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBottunToBack extends StatelessWidget {
  final void Function()? onTap;
  const CustomBottunToBack({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 4.h,
          width: 4.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.h),
              boxShadow: const [
                BoxShadow(blurRadius: 4, color: Colors.black12)
              ]),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 11.sp,
          ),
        ),
      ),
    );
  }
}
