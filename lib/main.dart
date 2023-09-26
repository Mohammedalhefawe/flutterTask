import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflutter/routes.dart';
import 'package:taskflutter/view/screen/auth/addPersonalImageScreen.dart';
import 'package:taskflutter/view/screen/auth/loginScreen.dart';
import 'package:taskflutter/view/screen/auth/signupScreen.dart';
import 'package:taskflutter/view/screen/home/informationVehicleScreen%20.dart';
import 'package:taskflutter/view/screen/home/myVehiclesScreen.dart';
import 'bindings/intialbindings.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'package:sizer/sizer.dart';
// import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        useInheritedMediaQuery: true,
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        theme: controller.appTheme,
        home: const LoginScreen(),
        locale: const Locale('ar'),
        initialBinding: InitialBindings(),
        getPages: routes,
      );
    });
  }
}
