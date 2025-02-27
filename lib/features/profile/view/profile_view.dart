import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/const/app_colors.dart';
import 'package:movie_app/core/const/splash_image.dart';
import 'package:movie_app/core/global_widgets/custom_button_container.dart';
import 'package:movie_app/features/profile/controller/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          SplashImage.splashImage,
        width: 150,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Name: ${controller.name.value}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => Text(
                'Email: ${controller.email.value}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomButtonContainer(
              buttonColor: AppColors.primaryColor,
              textColor: Colors.black,
              text: "Logout",
              onTap: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
