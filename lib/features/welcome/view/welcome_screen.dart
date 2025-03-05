import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/const/app_colors.dart';
import 'package:movie_app/core/const/image_path.dart';
import 'package:movie_app/core/const/splash_image.dart';
import 'package:movie_app/core/global_widgets/custom_button_container.dart';
import 'package:movie_app/core/style/global_textstyle.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only( 
          left: 20,
          right: 20,
          top: 55,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    SplashImage.splashImage,
                    width: 140,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Image.asset(ImagePath.loginImage),
              SizedBox(
                height: 10,
              ),
              Text(
                "MBooking Hello!",
                style: globalTextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              Text("Enjoy your favourite movies",
              style: globalTextStyle(
                color: Color(0xFFF2F2F2), 
                fontSize: 16, 
              ),
              ), 
              SizedBox(
                height: 20,
              ), 
              CustomButtonContainer(
                buttonColor: AppColors.primaryColor,
                textColor: Colors.black,
                text: "Signin", 
                onTap: (){
                  Get.offAllNamed("/loginScreen");
                },
                ),
              SizedBox(
                height: 20,
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
