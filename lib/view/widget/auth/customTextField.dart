import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';


class CustomTextField extends StatelessWidget {
  final bool? hasPrefix;
  final bool? isVisibility;
  final IconData prefixIcon;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField(
      {super.key,
      required this.prefixIcon,
      this.onTap,
      required this.hint,
      required this.controller,
      this.hasPrefix,
      this.isVisibility,
      this.keyboardType,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isVisibility == false,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(
            maxWidth: 7.w,
          ),
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: 2.5.w),
            child: Icon(
              prefixIcon,
              color: AppColor.primaryColor,
              size: 14.sp,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDADADA))),
          suffixIcon: hasPrefix == true
              ? InkWell(
                  onTap: onTap,
                  child: Icon(
                    isVisibility == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: const Color(0xffB1B1B1),
                    size: 14.sp,
                  ),
                )
              : null,
          hintText: hint,
          hintStyle: const TextStyle(
              color: Color(0xff272739),
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w600)),
    );
  }
}

class CustomTextFieldWithImage extends StatelessWidget {
  final String hint;
  final String? suffix;
  final String imageUrl;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  final TextEditingController controller;

  const CustomTextFieldWithImage({
    super.key,
    required this.hint,
    required this.controller,
    required this.imageUrl,
    this.readOnly,
    this.suffix,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      readOnly: readOnly == true ? true : false,
      validator: validator,
      style: TextStyle(
          fontSize: 12.sp,
          color: const Color(0xff272739),
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(
            maxWidth: 7.w,
          ),
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: 2.w),
            child: Image.asset(
              imageUrl,
              height: 1.8.h,
              width: 1.8.h,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDADADA))),
          suffixIcon: readOnly == true
              ? Padding(
                  padding: EdgeInsets.only(top: 1.9.h),
                  child: Text(
                    suffix!,
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColor.primaryColor,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w600),
                  ),
                )
              : null,
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xff272739),
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w600)),
    );
  }
}
