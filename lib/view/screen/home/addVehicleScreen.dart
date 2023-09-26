import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskflutter/core/class/handlingdataview.dart';
import 'package:taskflutter/core/functions/validinput.dart';
import 'package:taskflutter/view/screen/home/myVehiclesScreen.dart';
import 'package:taskflutter/view/widget/customButtonToBack.dart';
import '../../../controller/home/addVehicleController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/auth/addImageWidget.dart';
import '../../widget/auth/customTextField.dart';
import '../../widget/customDropDownButton.dart';
import '../../widget/customMaterialButton.dart';
import '../../widget/home/blurEffect.dart';

class AddVehicleScreen extends StatelessWidget {
  const AddVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddVehicleController());

    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: CustomBottunToBack(
                onTap: () {
                  Get.off(() => const MyVehiclesScreen());
                },
              ),
              centerTitle: true,
              title: Text(
                'إضافة مركبة',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontFamily: 'Tajawal'),
              ),
            ),
            body: GetBuilder<AddVehicleController>(builder: (controller) {
              return HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          width: 100.w,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80.h,
                                child: Column(
                                  children: [
                                    CustomDropDownButton(
                                      imageUrl: AppImageAsset.typeVehicle,
                                      hintText: 'نوع المركبة',
                                      listData: controller.listSelectVehicle,
                                      onChanged: (val) {
                                        controller.selectVehicle(val);
                                      },
                                      isSelected: controller.typeVehicleSelect,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    CustomTextFieldWithImage(
                                      hint: 'الموديل',
                                      keyboardType: TextInputType.name,
                                      controller: controller.model,
                                      imageUrl: AppImageAsset.modelVehicle,
                                      validator: (val) {
                                        return validInput(val!, 5, 10, '');
                                      },
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    CustomDropDownButton(
                                      imageUrl: AppImageAsset.colorVehicle,
                                      hintText: 'لون المركبة',
                                      listData: controller.colors,
                                      onChanged: (val) {
                                        controller.selectColor(val);
                                      },
                                      isSelected: controller.colorSelected,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    CustomTextFieldWithImage(
                                      keyboardType: TextInputType.number,
                                      hint: 'رقم اللوحة',
                                      controller: controller.numberVehicle,
                                      imageUrl: AppImageAsset.numberVehicle,
                                      validator: (val) {
                                        return validInput(val!, 5, 10, '');
                                      },
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'صور المركبة',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontFamily: 'Tajawal'),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.7.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '1-صورة الميكانيك\n2-صورة المركبة\n3- صورة اللوحة\n4- الهوية الشخصية\n5-الوكالة أو التفويض',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff747474),
                                                  fontSize: 10.sp,
                                                  height: 1.5,
                                                  fontFamily: 'Tajawal'),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                        width: 100.w,
                                        height: 18.h,
                                        child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              if (index == 0 &&
                                                  controller.files.length < 5) {
                                                return AddImageWidget(
                                                  onTap: () {
                                                    controller.pickMultiImage();
                                                  },
                                                );
                                              } else {
                                                return Container(
                                                  height: 18.h,
                                                  width: 18.h,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Image.file(
                                                    controller.files[controller
                                                                .files.length <
                                                            5
                                                        ? index - 1
                                                        : index]!,
                                                    fit: BoxFit.fill,
                                                  ),
                                                );
                                              }
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                width: 6.w,
                                              );
                                            },
                                            itemCount: controller.files.length <
                                                    5
                                                ? controller.files.length + 1
                                                : controller.files.length)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: CustomMaterialButton(
                                  onPressed: () {
                                    controller.addVehicle();
                                  },
                                  text: 'إضافة مركبة',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
            })),
        // Blur effect at the top of the screen
        GetBuilder<AddVehicleController>(builder: (controller) {
          if (controller.isLoad == true) {
            return BlurEffect(
              onPressed: () {
                controller.isLoad = false;
                controller.update();
              },
            );
          } else {
            return const SizedBox();
          }
        }),
      ],
    );
  }
}
