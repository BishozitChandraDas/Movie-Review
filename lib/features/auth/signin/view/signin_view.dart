import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/const/app_colors.dart';
import 'package:movie_app/core/const/background_image.dart';
import 'package:movie_app/core/const/splash_image.dart';
import 'package:movie_app/core/global_widgets/custom_button_container.dart';
import 'package:movie_app/core/global_widgets/text_field.dart';
import 'package:movie_app/features/auth/signin/controller/signin_controller.dart';

import '../../../../core/style/global_textstyle.dart';

class SigninView extends StatelessWidget {
   SigninView({super.key});

  final SigninController controller = Get.put(SigninController()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              BackgroundImage.loginBackground),
          fit: BoxFit.cover, 
          )
        ),
        child: Padding(padding: EdgeInsets.only(
          left: 24, 
          right: 24,
          bottom: 20, 
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(SplashImage.splashImage,
            width: 180,
            ), 
            SizedBox(
              height: 10,
            ), 
            Text("For enjoying the app please login",
              style: globalTextStyle(
                color: Color(0xFFF2F2F2), 
                fontSize: 16, 
              ),
              ), 
            SizedBox(
              height: 50,
            ), 
            CustomTextField(
              hintText: "abc@gmail.com",
              prefixIcon: Icon(Icons.email),
              controller: controller.emailController,
            ), 
            SizedBox(
              height: 20,
            ), 
            Obx(
                () => CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Enter your password",
                  prefixIcon: Icon(Icons.lock),
                  isObscure: !controller.isPasswordVisible.value,
                  suffixIcon: Obx(
                    () => InkWell(
                      child: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 24,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        controller.isPasswordVisible.value =
                            !controller.isPasswordVisible.value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ), 
              CustomButtonContainer(
                buttonColor: AppColors.primaryColor,
                textColor: Colors.black,
              text: "Signin", 
              onTap: (){
                controller.signIn(); 
              },
              ),
              SizedBox(
                height: 30,
              ), 
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Color(0xFFF1F3F4),
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "or",
                      style: globalTextStyle(
                        color: Color(0xFFBDC1C6),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color(0xFFF1F3F4),
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ), 
              CustomButtonContainer(
                buttonColor: Colors.transparent,
                borderColor: Colors.white,
                textColor: Colors.white,
                text: "SIgnup", 
              onTap: (){
                Get.offAllNamed('/registerScreen');
              },
              )  
          ],
        ),
        ),
      ),
    );
  }
}