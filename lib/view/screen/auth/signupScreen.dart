import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskflutter/controller/auth/signupController.dart';
import 'package:taskflutter/core/constant/imgaeasset.dart';
import 'package:taskflutter/view/screen/auth/loginScreen.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/RowForTowTextAndOnTap.dart';
import '../../widget/auth/conditionText.dart';
import '../../widget/auth/customButtonToBack.dart';
import '../../widget/auth/customTextField.dart';

import 'package:show_up_animation/show_up_animation.dart';

import '../../widget/home/customMaterialButton.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
      body: GetBuilder<SignupController>(builder: (controller) {
        return Form(
          key: controller.formstate,
          child: ListView(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: CustomBottunToBack(
                      onTap: () {
                        Get.offAll(() => const LoginScreen());
                      },
                    ),
                  )
                ],
              ),
              Image.asset(
                AppImageAsset.logo,
                height: 6.h,
              ),
              Container(
                width: 100.w,
                decoration: const BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(
                        image: AssetImage(
                          AppImageAsset.splashWithOpacity,
                        ),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: Column(
                    children: [
                      ShowUpAnimation(
                        delayStart: const Duration(microseconds: 0),
                        animationDuration: const Duration(seconds: 1),
                        curve: Curves.bounceIn,
                        direction: Direction.vertical,
                        offset: 0.5,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'إنشاء حساب',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                      fontFamily: 'Tajawal'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              controller: controller.name,
                              hint: 'الاسم',
                              prefixIcon: Icons.person,
                              validator: (val) {
                                return validInput(val!, 4, 25, '');
                              },
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            CustomTextField(
                              controller: controller.phone,
                              hint: 'رقم الهاتف',
                              keyboardType: TextInputType.phone,
                              prefixIcon: Icons.phone,
                              validator: (val) {
                                return validInput(val!, 10, 15, 'phone');
                              },
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            CustomTextField(
                              controller: controller.password,
                              hint: 'كلمة السر',
                              prefixIcon: Icons.lock,
                              hasPrefix: true,
                              isVisibility: controller.isVisible1,
                              onTap: () {
                                controller.changeToVisible1();
                              },
                              validator: (val) {
                                return validInput(val!, 8, 15, '');
                              },
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            CustomTextField(
                              controller: controller.confirmPassword,
                              isVisibility: controller.isVisible2,
                              hint: 'تاكيد كلمة السر',
                              prefixIcon: Icons.lock,
                              hasPrefix: true,
                              onTap: () {
                                controller.changeToVisible2();
                              },
                              validator: (val) {
                                return validInput(val!, 8, 15, '');
                              },
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: CustomMaterialButton(
                                onPressed: () {
                                  controller.onPressedSignUp();
                                },
                                text: 'إنشاء حساب',
                              ),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            RowForTowTextAndOnTap(
                              text1: 'لديك حساب؟  ',
                              text2: 'تسجيل الدخول',
                              onTap: () {
                                Get.offAll(() => const LoginScreen());
                              },
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            const ConditionText(),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
