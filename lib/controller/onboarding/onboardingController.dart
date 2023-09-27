import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflutter/view/screen/auth/loginScreen.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController();
  int index = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  setIndex(index) {
    this.index = index;
    update();
  }

  toNext() {
    if (index < 2) {
      index++;
      pageController.animateToPage(index,
          duration: const Duration(microseconds: 10000),
          curve: Curves.fastLinearToSlowEaseIn);
      update();
      print(index);
    } else {
      //go to home page
      Get.offAll(() => const LoginScreen());
    }
  }

  toback() {
    if (index > 0) {
      index--;
      pageController.animateToPage(index,
          duration: const Duration(microseconds: 3500),
          curve: Curves.fastLinearToSlowEaseIn);
      update();
    }
  }

  skep() {
    index = 2;
    pageController.animateToPage(index,
        duration: const Duration(microseconds: 200), curve: Curves.easeInOut);
    update();
  }
}
