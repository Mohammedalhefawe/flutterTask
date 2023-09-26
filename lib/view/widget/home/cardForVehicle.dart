import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';

class CardForVehicle extends StatelessWidget {
  final String nameVehicle;
  final String text1;
  final String text2;
  final String imageUrl;
  final int index;

  const CardForVehicle(
      {super.key,
      required this.nameVehicle,
      required this.text1,
      required this.text2,
      required this.imageUrl,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        alignment: Alignment.center,
        height: 22.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: index == 0
                ? Border.all(color: AppColor.primaryColor, width: 3)
                : null,
            boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black12)]),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nameVehicle,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            index == 0 ? AppColor.primaryColor : Colors.black,
                        fontSize: 13.sp,
                        fontFamily: 'Tajawal'),
                  ),
                  ClipOval(
                    child: CircleAvatar(
                        backgroundColor: const Color(0xffEFF1F0),
                        radius: 7.w,
                        child: Padding(
                          padding: EdgeInsets.all(0.w),
                          child: FadeInImage.assetNetwork(
                            placeholder: AppImageAsset.logo,
                            image: imageUrl,
                            fit: BoxFit.fill,
                            width: 100.w,
                            height: 100.h,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'سعر الكيلو:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: index == 0 ? AppColor.primaryColor : Colors.black,
                      fontSize: 13.sp,
                      fontFamily: 'Tajawal'),
                ),
                Text(
                  text1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: index == 0 ? AppColor.primaryColor : Colors.black,
                      fontSize: 13.sp,
                      fontFamily: 'Tajawal'),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'نسبة ربح الشركة',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: index == 0 ? AppColor.primaryColor : Colors.black,
                      fontSize: 13.sp,
                      fontFamily: 'Tajawal'),
                ),
                Text(
                  text2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: index == 0 ? AppColor.primaryColor : Colors.black,
                      fontSize: 13.sp,
                      fontFamily: 'Tajawal'),
                ),
              ],
            ),
          ],
        ));
  }
}
