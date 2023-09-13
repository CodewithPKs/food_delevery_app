import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:serv_me/routes/route_helper.dart';
import 'package:serv_me/utils/dimensions.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> with TickerProviderStateMixin{
  
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResoureces() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  
  @override
  void initState(){
    super.initState();
    _loadResoureces();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();
    animation =  CurvedAnimation(
        parent: controller,
        curve: Curves.linear);

        Timer(
        const Duration(seconds: 3),
         ()=>Get.offNamed(RouteHelper.getInitial()),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(
                  child: Image.asset("assets/image/food-logo.png"),
              ),
            ),
        ],
      ),
    );
  }
}
