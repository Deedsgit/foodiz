// import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:foody/controllers/cart_controller.dart';
import 'package:foody/controllers/popular_product_controller.dart';
import 'package:foody/controllers/recommended_product_controller.dart';
// import 'package:foody/pages/auth/sign_in_page.dart';
// import 'package:foody/pages/food/popular_food_detail.dart';
// import 'package:foody/pages/home/food_page_body.dart';
// import 'package:foody/pages/home/home_page.dart';
// import 'package:foody/pages/home/main_food_page.dart';
// import 'package:foody/pages/auth/sign_up_page.dart';
// import 'package:foody/pages/splash/splash_page.dart';
// import 'package:foody/controllers/popular_product_controller.dart';
// import 'package:foody/controllers/recommended_product_controller.dart';
// import 'package:foody/pages/home/food_page_body.dart;
// import 'package:foody/pages/home/main_food_page.dart';
import 'package:foody/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Foody',
          // home: HomePage(),
          initialRoute: RouteHelper.getSpalshPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
