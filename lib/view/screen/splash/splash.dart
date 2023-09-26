import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/imgaeasset.dart';
import '../onboarding/onboardingScreen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(children: [
        AnimatedSplashScreen(
          splashIconSize: Get.height,
          splash: Image.asset(AppImageAsset.splash, fit: BoxFit.cover),
          nextScreen: const OnboardingScreen(),
          splashTransition: SplashTransition.fadeTransition,
          duration: 1000,
        ),
      ]),
    );
  }
}
