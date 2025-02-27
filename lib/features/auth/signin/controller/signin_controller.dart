import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  void togglePasswordVisible() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> signIn() async {
    try {
      EasyLoading.show(status: "Loading...");
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      EasyLoading.showSuccess("Logged in successfully");

      Get.offNamed('/bottomNavbarScreen');
    } catch (e) {
      EasyLoading.showError("Failed to login cause $e");
      if (kDebugMode) {
        print("//////////The error is $e");
      }
    }
  }
}
