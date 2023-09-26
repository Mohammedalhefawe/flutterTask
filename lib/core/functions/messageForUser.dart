import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

messageTrue(String messageText) {
  return Get.snackbar("Success", messageText,
      colorText: Colors.white,
      backgroundColor: AppColor.primaryColor,
      duration: const Duration(seconds: 1));
}

messageFalse(String messageText) {
  return Get.snackbar("fail", messageText,
      colorText: Colors.white,
      backgroundColor: Colors.red.withOpacity(0.7),
      duration: const Duration(seconds: 2));
}
