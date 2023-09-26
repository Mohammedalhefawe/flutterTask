import 'package:get/get.dart';

import '../../data/model/myVehiclesModel.dart';

class InformationVehicleController extends GetxController {
  Map<String, dynamic> data = {};
  List images = [];
  @override
  void onInit() {
    data = Get.arguments;
    images.add(Vehicle.fromJson(data).mechanicImage);
    images.add(Vehicle.fromJson(data).vehicleImage);
    images.add(Vehicle.fromJson(data).boardImage);
    images.add(Vehicle.fromJson(data).idImage);
    images.add(Vehicle.fromJson(data).delegateImage);
    super.onInit();
  }
}
