import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskflutter/controller/home/informationVehicleController.dart';
import 'package:taskflutter/linkapi.dart';
import 'package:taskflutter/view/widget/home/customTextFieldOnlyRead.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../data/model/myVehiclesModel.dart';
import '../../widget/auth/customButtonToBack.dart';
import '../../widget/home/customMaterialButton.dart';

class InformationVehicleScreen extends StatelessWidget {
  const InformationVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InformationVehicleController());
    return GetBuilder<InformationVehicleController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: CustomBottunToBack(
              onTap: () {
                Get.back();
              },
            ),
            centerTitle: true,
            title: Text(
              'معلومات المركبة',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'Tajawal'),
            ),
          ),
          body: Stack(
            children: [
              ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    width: 100.w,
                    child: SizedBox(
                      height: 100.h,
                      child: Column(
                        children: [
                          CustomTextFieldOnlyRead(
                            hint: 'نوع المركبة',
                            suffix: Vehicle.fromJson(controller.data).type.name,
                            imageUrl: AppImageAsset.typeVehicle,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomTextFieldOnlyRead(
                            hint: 'الموديل',
                            suffix: Vehicle.fromJson(controller.data).model,
                            imageUrl: AppImageAsset.modelVehicle,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomTextFieldOnlyRead(
                            hint: 'لون المركبة',
                            suffix: Vehicle.fromJson(controller.data).color,
                            imageUrl: AppImageAsset.typeVehicle,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomTextFieldOnlyRead(
                            hint: 'رقم اللوحة',
                            imageUrl: AppImageAsset.numberVehicle,
                            suffix: Vehicle.fromJson(controller.data)
                                .boardNumber
                                .toString(),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          const CustomTextFieldOnlyRead(
                            hint: 'رقم اللوحة',
                            suffix: 'رقم اللوحة',
                            imageUrl: AppImageAsset.numberVehicle,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          const CustomTextFieldOnlyRead(
                            hint: 'رقم اللوحة',
                            suffix: 'رقم اللوحة',
                            imageUrl: AppImageAsset.numberVehicle,
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
                                        color: const Color(0xff747474),
                                        fontSize: 10.sp,
                                        height: 1.8,
                                        fontFamily: 'Tajawal'),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                              width: 100.w,
                              height: 18.h,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 18.h,
                                      width: 18.h,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: AppImageAsset.logo,
                                        image: AppLink.imagesServer +
                                            controller.images[index],
                                        fit: BoxFit.fill,
                                        width: 100.w,
                                        height: 100.h,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 6.w,
                                    );
                                  },
                                  itemCount: 5)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 1.h,
                left: 3.w,
                right: 3.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: CustomMaterialButton(
                    onPressed: () {},
                    text: 'إضافة مركبة',
                  ),
                ),
              )
            ],
          ));
    });
  }
}
