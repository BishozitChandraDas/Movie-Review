import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  void togglePasswordVisible() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> signUp() async {
    try {
      EasyLoading.show(status: "Loading");
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      });

      EasyLoading.showSuccess("User registered successfully");
      Get.offAllNamed('/bottomNavbarScreen');
    } catch (e) {
      EasyLoading.showError("Failed to register $e");
      if (kDebugMode) {
        print("/////////The error is: $e");
      } 
    } finally {
      EasyLoading.dismiss();
    }
  }
}
