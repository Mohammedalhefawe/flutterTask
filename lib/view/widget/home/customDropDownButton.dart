import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDropDownButton extends StatelessWidget {
  final String hintText;
  final String imageUrl;
  final List listData;
  final isSelected;
  final void Function(Object?)? onChanged;
  const CustomDropDownButton({
    super.key,
    required this.hintText,
    required this.listData,
    this.onChanged,
    this.isSelected,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffDADADA), width: 1))),
      child: DropdownButton(
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(5),
          iconSize: 17.sp,
          icon: const Icon(
            Icons.expand_more,
            color: Colors.black,
          ),
          hint: Row(
            children: [
              Image.asset(
                imageUrl,
                height: 1.8.h,
                width: 1.8.h,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(hintText,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff272739),
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w600)),
            ],
          ),
          isExpanded: true,
          value: isSelected,
          items: listData
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        Image.asset(
                          imageUrl,
                          height: 1.8.h,
                          width: 1.8.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(e,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  height: 2,
                                  color: const Color(0xff272739),
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ))
              .toList(),
          onChanged: onChanged),
    );
  }
}
