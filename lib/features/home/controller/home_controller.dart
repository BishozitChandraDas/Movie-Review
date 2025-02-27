import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  var movies = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  Future<void> fetchMovies() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://freetestapi.com/api/v1/movies'));

      if (kDebugMode) {
        print("The body is ${response.body}");
      } 

      if(kDebugMode){
        print("The response status code is ${response.statusCode}"); 
      }


      if (response.statusCode == 200) {
        movies.value = json.decode(response.body);
      } else {
        if (kDebugMode) {
          print("Failed to load data");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("The error is: $e");
      } 
    } finally {
      isLoading(false);
    }
  }
}
