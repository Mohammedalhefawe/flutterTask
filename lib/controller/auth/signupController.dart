import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflutter/view/screen/auth/addPersonalImageScreen.dart';

class SignupController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isVisible1 = false, isVisible2 = false;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    // TODO: implement onClose
    super.onClose();
  }

  goToAddImage() {
    Get.off(() => const AddPersonalImageScreen(), arguments: {
      'name': name.text,
      'phone': phone.text,
      'password': password.text
    });
  }

  changeToVisible1() {
    isVisible1 = !isVisible1;
    update();
  }

  changeToVisible2() {
    isVisible2 = !isVisible2;
    update();
  }

  onPressedSignUp() async {
    if (password.text != confirmPassword.text) {
      return Get.snackbar(
          "فشل", 'يجب أن تكون كلمة السر وتأكيد كلمة السر  نفس الرمز',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
    if (formstate.currentState!.validate()) {
      goToAddImage();
    }
  }
}
