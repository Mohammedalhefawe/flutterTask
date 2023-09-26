import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskflutter/view/screen/home/myVehiclesScreen.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/functions/messageForUser.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/signupData.dart';
import '../../linkapi.dart';

class AddPersonalImageController extends GetxController {
  File? file;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  Map data = {};
  @override
  void onInit() {
    // TODO: implement onInit
    data = Get.arguments;
    super.onInit();
  }

  void pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      update();
    } else {
      Get.defaultDialog(middleText: 'You must switch image');
    }
  }

  signup() async {
    if (file != null) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.signupData(
          data['name'], data['phone'], data['password'], file);
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map mapData = {};
        mapData.addAll(response);
        print(mapData);
        if (mapData["status"] == "success") {
          AppLink.token = mapData['data']["token"];
          myServices.sharedPreferences
              .setString("token", mapData['data']["token"]);
          //go to homepage
          Get.offAll(() => const MyVehiclesScreen());
          return messageTrue('Welcolme');
        } else {
          return messageFalse("The email or password is falut ");
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return messageFalse("you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return messageFalse('The email has already been taken');
      }
    } else {
      return Get.snackbar("فشل", "الرجاء اختيار صورة واعادة المحاولة");
    }
  }
}
