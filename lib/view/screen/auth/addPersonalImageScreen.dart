import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskflutter/core/class/handlingdataview.dart';
import 'package:taskflutter/core/constant/color.dart';
import 'package:taskflutter/core/constant/imgaeasset.dart';

import '../../../controller/auth/addPersonalImageController.dart';
import '../../widget/customMaterialButton.dart';

class AddPersonalImageScreen extends StatelessWidget {
  const AddPersonalImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddPersonalImageController());
    return Scaffold(
      body: GetBuilder<AddPersonalImageController>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Image.asset(
                  AppImageAsset.logo,
                  height: 6.h,
                ),
                Container(
                  height: 83.h,
                  width: 100.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'أضف صورتك الشخصية',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 17.sp,
                                fontFamily: 'Tajawal'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'اجعل صورتك واضحة',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                                fontFamily: 'Tajawal'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 25.h,
                              width: 25.h,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(200.h),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 4, color: Colors.black12)
                                  ]),
                              child: controller.file == null
                                  ? Icon(
                                      Icons.person,
                                      color: const Color(0xffE5E5E5),
                                      size: 100.sp,
                                    )
                                  : Image.file(
                                      controller.file!,
                                      fit: BoxFit.cover,
                                      height: 25.h,
                                      width: 25.h,
                                    ),
                            ),
                            Positioned(
                              right: 4.h,
                              bottom: 0.h,
                              child: InkWell(
                                onTap: () {
                                  controller.pickImage();
                                },
                                child: CircleAvatar(
                                  backgroundColor: AppColor.primaryColor,
                                  child: Icon(
                                    controller.file == null
                                        ? Icons.add
                                        : Icons.edit,
                                    color: Colors.white,
                                    size: 17.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.w),
                        child: CustomMaterialButton(
                          onPressed: () {
                            controller.signup();
                          },
                          text: 'التالي',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
