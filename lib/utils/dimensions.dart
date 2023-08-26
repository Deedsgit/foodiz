// import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class Dimensions {
  static double screenHeigth = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageView = screenHeigth / 2.54;
  static double pageViewContainer = screenHeigth / 3.75;
  static double pageTextContainer = screenHeigth / 7.03;

  static double height10 = screenHeigth / 82.5;
  static double height15 = screenHeigth / 55;
  static double height20 = screenHeigth / 41.25;
  static double height30 = screenHeigth / 26.13;
  static double height45 = screenHeigth / 16.76;

  static double width10 = screenHeigth / 82.5;
  static double width15 = screenHeigth / 55;
  static double width20 = screenHeigth / 41.25;
  static double width30 = screenHeigth / 26.13;

  static double font16 = screenHeigth / 50.75;
  static double font20 = screenHeigth / 40.2;
  static double font26 = screenHeigth / 30.46;

  static double radius15 = screenHeigth / 54.27;
  static double radius20 = screenHeigth / 40.2;
  static double radius30 = screenHeigth / 26.13;

  //icon size
  static double iconSize24 = screenHeigth / 33.17;
  static double iconSize16 = screenHeigth / 50.75;

  //list view size
  static double listViewImgSize = screenWidth / 3.5;
  static double listViewTextcontSize = screenWidth / 3.9;
//popular food
  static double popularFoodImgSize = screenHeigth / 2.41;

//bottom height
  static double bottomHeightBar = screenHeigth / 7.03;

//splash screen
  static double splashImg = screenHeigth / 3.375;
}
