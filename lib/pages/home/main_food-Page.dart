import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serv_me/pages/home/food_page_body.dart';
import 'package:serv_me/utils/dimensions.dart';
import 'package:serv_me/widgets/big_text.dart';
import 'package:serv_me/widgets/small_text.dart';

import '../../utils/colors.dart';
// import '../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "India", color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "Bhopal", color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container (
                      child: Icon(Icons.search, color: Colors.white, size: Dimensions.icon24,),
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radious15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
          //showing the body
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
