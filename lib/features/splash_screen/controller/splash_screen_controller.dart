import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Rx<Animation<double>> scaleAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.2)
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut))
        .obs;

    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user != null) {
          // User is logged in, navigate to bottomNavbar screen
          Get.offNamed('/bottomNavbarScreen');
        } else {
          // No user is logged in, navigate to the login screen
          Get.offNamed('/welcomeScreen');
        }
      });
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
