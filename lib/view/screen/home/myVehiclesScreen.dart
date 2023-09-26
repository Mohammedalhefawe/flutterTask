import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskflutter/core/class/handlingdataview.dart';
import 'package:taskflutter/data/model/myVehiclesModel.dart';
import 'package:taskflutter/linkapi.dart';
import 'package:taskflutter/view/screen/home/informationVehicleScreen%20.dart';
import 'package:taskflutter/view/widget/customButtonToBack.dart';
import '../../../controller/home/myVehiclesController.dart';
import '../../widget/customMaterialButton.dart';
import '../../widget/home/cardForVehicle.dart';
import 'addVehicleScreen.dart';

class MyVehiclesScreen extends StatelessWidget {
  const MyVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyVehiclesController());

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: CustomBottunToBack(
            onTap: () {},
          ),
          centerTitle: true,
          title: Text(
            'مركباتي',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Tajawal'),
          ),
        ),
        body: GetBuilder<MyVehiclesController>(builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                width: 100.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => const InformationVehicleScreen(),
                                    arguments: controller.data[index]);
                              },
                              child: CardForVehicle(
                                index: index,
                                imageUrl: AppLink.imagesServer +
                                    Vehicle.fromJson(controller.data[index])
                                        .vehicleImage,
                                nameVehicle:
                                    Vehicle.fromJson(controller.data[index])
                                        .model,
                                text1: '20000\$',
                                text2: '23 km.h',
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 3.h,
                            );
                          },
                          itemCount: controller.data.length),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: CustomMaterialButton(
                        onPressed: () {
                          Get.to(() => const AddVehicleScreen());
                        },
                        text: 'إضافة مركبة',
                      ),
                    ),
                  ],
                ),
              ));
        }));
  }
}
