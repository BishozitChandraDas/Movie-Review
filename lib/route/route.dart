import 'package:get/get.dart';
import 'package:movie_app/features/auth/signin/view/signin_view.dart';
import 'package:movie_app/features/auth/signup/view/signup_view.dart';
import 'package:movie_app/features/welcome/view/welcome_screen.dart';

import '../features/bottom_navbar/view/bottom_navbar_view.dart';
import '../features/splash_screen/view/splash_screen.dart';


class AppRoute {
  static String splashScreen = '/splashScreen';
  static String registerScreen = '/registerScreen';
  static String loginScreen = '/loginScreen';
  static String welcomeScreen = '/welcomeScreen';
  static String bottomNavbarScreen = '/bottomNavbarScreen';


  static String getSplashScreen() => splashScreen; 
  static String getregisterScreen() => registerScreen;
  static String getwelcomeScreen() => welcomeScreen;
  static String getbottomNavbarScreen() => bottomNavbarScreen; 


  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () =>  SplashScreen()),
    GetPage(name: registerScreen, page: () => SignupView()),
    GetPage(name: loginScreen, page: () => SigninView()),
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: bottomNavbarScreen, page: () => BottomNavbar()),
  ];
}