import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskflutter/data/datasource/remote/auth/addVehicleData.dart';
import 'package:taskflutter/data/model/myVehiclesModel.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/functions/messageForUser.dart';
class AddVehicleController extends GetxController {
  TextEditingController model = TextEditingController();
  TextEditingController numberVehicle = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  AddVehicleData addVehicleData = AddVehicleData(Get.find());
  bool isLoad = false;
  List data = [];
  List listSelectVehicle = [];
  Map typesVehicle = {};
  List<File?> files = [];
  int? idTypeVehicle;
  var typeVehicleSelect, colorSelected;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<String> colors = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Purple",
    "Pink",
    "Brown",
    "Black",
    "White",
  ];

  @override
  void onInit() {
    getTypeVehiclesData();
    super.onInit();
  }

  selectVehicle(value) {
    typeVehicleSelect = value;
    idTypeVehicle = typesVehicle[value];
    print(idTypeVehicle);
    update();
  }

  selectColor(value) {
    colorSelected = value;
    update();
  }

  pickMultiImage() async {
    List<XFile?> images = await ImagePicker().pickMultiImage();
    // ignore: unnecessary_null_comparison
    if (images != null) {
      for (int i = 0; i < images.length; i++) {
        files.add(File(images[i]!.path));
      }
      print('============ $files');
      update();
    } else {
      Get.defaultDialog(middleText: 'You must switch image');
    }
  }

  getTypeVehiclesData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addVehicleData.typesVehiclesData();
    print("=============================== response $response ");
    print("=============================== statusRequest $statusRequest ");
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == "success") {
        data = mapData['data'];
        data.forEach(
          (element) {
            listSelectVehicle.add(VehicleType.fromJson(element).name);
            typesVehicle[VehicleType.fromJson(element).name] =
                VehicleType.fromJson(element).id;
          },
        );
        print(typesVehicle);
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }

  addVehicle() async {
    if (files.length < 5) {
      return messageFalse("يجب اختيار 5 صور ");
    }

    if (formstate.currentState!.validate() &&
        colorSelected != null &&
        idTypeVehicle != null) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addVehicleData.addVehicleData(
          idTypeVehicle.toString(),
          numberVehicle.text,
          model.text,
          colorSelected,
          files);
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map mapData = {};
        mapData.addAll(response);
        print(mapData);
        if (mapData["status"] == "success") {
          isLoad = true;
          update();
          //go to homepage
          // Get.offAll(() => const MyVehiclesScreen());
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
      return messageFalse('يجب ملئ جميع الحقول');
    }
  }
}
