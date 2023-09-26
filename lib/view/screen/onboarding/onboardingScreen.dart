import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskflutter/controller/onboarding/onboardingController.dart';
import 'package:taskflutter/core/constant/color.dart';
import '../../../data/datasource/static/static.dart';
import '../../widget/circularIndicator.dart';
import '../../widget/customButtonToBack.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return GetBuilder<OnboardingController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
              elevation: 0,
              actions: [
                controller.index != 2
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: InkWell(
                          onTap: () {
                            controller.skep();
                          },
                          child: Center(
                            child: Text(
                              'تخطي ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 15.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
              leading: controller.index != 0
                  ? CustomBottunToBack(
                      onTap: () {
                        controller.toback();
                      },
                    )
                  : const SizedBox()),
          body: SizedBox(
              height: 100.h,
              width: 100.w,
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: PageView(
                      controller: controller.pageController,
                      onPageChanged: (value) {
                        controller.setIndex(value);
                      },
                      children: List.generate(onBoardingList.length, (index) {
                        return Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              onBoardingList[controller.index],
                            ),
                          )),
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: controller.index != 2
                        ? CircularIndicator(
                            percent: controller.index == 0 ? 0.4 : 0.7,
                            onTap: () {
                              controller.toNext();
                            },
                          )
                        : CircleAvatar(
                            radius: 35.0,
                            backgroundColor: AppColor.primaryColor,
                            child: Text(
                              'يلا نبلش',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ),
                  )
                ],
              )));
    });
  }
}
