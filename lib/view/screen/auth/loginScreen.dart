import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskflutter/core/class/handlingdataview.dart';
import 'package:taskflutter/core/constant/imgaeasset.dart';
import 'package:taskflutter/view/screen/auth/signupScreen.dart';
import '../../../controller/auth/loginController.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/RowForTowTextAndOnTap.dart';
import '../../widget/auth/customTextField.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../widget/home/customMaterialButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  SizedBox(
                    height: 6.h,
                  ),
                  Image.asset(
                    AppImageAsset.logo,
                    height: 6.h,
                  ),
                  Container(
                    width: 100.w,
                    height: 84.h,
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
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 17.sp,
                                          fontFamily: 'Tajawal'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                CustomTextField(
                                  controller: controller.phone,
                                  hint: 'رقم الهاتف',
                                  prefixIcon: Icons.phone,
                                  keyboardType: TextInputType.phone,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'هل نسيت كلمة السر؟',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 11.sp,
                                          fontFamily: 'Tajawal'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.w),
                                  child: CustomMaterialButton(
                                    onPressed: () {
                                      controller.login();
                                    },
                                    text: 'تسجيل الدخول',
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                RowForTowTextAndOnTap(
                                  text1: 'ليس لديك حساب؟  ',
                                  text2: 'إنشاء حساب',
                                  onTap: () {
                                    Get.off(() => const SignupScreen());
                                  },
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
            ));
      }),
    );
  }
}
