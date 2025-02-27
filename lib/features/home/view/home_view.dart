import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/const/app_colors.dart';
import '../../../core/const/splash_image.dart';
import '../../../core/style/global_textstyle.dart';
import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(
          top: 55,
          right: 24,
          left: 24,
          bottom: 20,
        ),
        child: Column(
         
          children: [
            Row(
              children: [
                Image.asset(
                  SplashImage.splashImage,
                  width: 120,
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }

                if (controller.movies.isEmpty) {
                  return Center(
                    child: Text(
                      "No movies found",
                      style: globalTextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: controller.movies.length,
                  itemBuilder: (context, index) {
                    var movie = controller.movies[index];
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  movie['poster'],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(
                                    Icons.image_not_supported,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie['title'],
                                      style: globalTextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: AppColors.primaryColor,
                                        ),
                                        Text("${movie['rating']}",
                                            style: globalTextStyle(
                                                color: Colors.white70)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Language: ${movie['language']}",
                                style: globalTextStyle(color: Colors.white70),
                              ),
                              const Spacer(), 
                               Text(
                            "Year: ${movie['year']}",
                            style: globalTextStyle(color: Colors.white70),
                          ),
                            ],
                          ),
                         
                          Text(
                            "Director: ${movie['director']}",
                            style: globalTextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
