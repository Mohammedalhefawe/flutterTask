import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflutter/data/datasource/remote/auth/loginData.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/functions/messageForUser.dart';
import '../../core/services/services.dart';
import '../../linkapi.dart';
import '../../view/screen/home/myVehiclesScreen.dart';

class LoginController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  bool isVisible1 = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  changeToVisible1() {
    isVisible1 = !isVisible1;
    update();
  }

  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.loginData(phone.text, password.text);
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
    }
  }
}
