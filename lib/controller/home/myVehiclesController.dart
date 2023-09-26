import 'package:get/get.dart';
import 'package:taskflutter/data/datasource/remote/auth/myVehiclesData.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';

class MyVehiclesController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyVehiclesData myVehiclesData = MyVehiclesData(Get.find());
  List data = [];
  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myVehiclesData.myVehicles();
    print("=============================== response $response ");
    print("=============================== statusRequest $statusRequest ");
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      Map mapData = {};
      mapData.addAll(response);
      print(mapData);
      if (mapData["status"] == "success") {
        data = mapData['data'];
        print(data);
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }
}
