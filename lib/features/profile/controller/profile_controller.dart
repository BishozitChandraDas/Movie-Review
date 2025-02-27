import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString name = ''.obs;
  RxString email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
       
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          name.value = userDoc['name'] ?? 'No Name';
          email.value = userDoc['email'] ?? 'No Email';
          if (kDebugMode) {
            print("////////The name is ${name.value}");
          }
        }
      }
    } catch (e) {
      EasyLoading.showError("Error fetching user data: $e");
      if (kDebugMode) {
        print("The error for fetching data of profile is $e");
      }
    }
  }

  Future<void> logout() async {
    try {
      EasyLoading.show(status: "Logging out...");
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed('/loginScreen');
    } catch (e) {
      EasyLoading.showError("Error $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
