import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serv_me/controllers/popular_product_controller.dart';
import 'package:serv_me/controllers/recommended_product_controller.dart';
import 'package:serv_me/pages/cart/cart_page.dart';
import 'package:serv_me/pages/food/recommended_food.dart';
import 'package:serv_me/pages/home/food_page_body.dart';
import 'package:serv_me/pages/home/home_page.dart';
import 'package:serv_me/pages/home/main_food-Page.dart';
import 'package:serv_me/pages/splash/splash_screen.dart';
import 'package:serv_me/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  return GetBuilder<PopularProductController>(builder: (_){
    return GetBuilder<RecommendedProductController>(builder: (_){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        //home: MainFoodPage(),
        //home: SpalshScreen(),
        initialRoute: RouteHelper.getspalashScreen(),
        getPages: RouteHelper.routes,
      );
    });
  });
  }
}

