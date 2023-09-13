import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serv_me/controllers/cart_controller.dart';
import 'package:serv_me/controllers/popular_product_controller.dart';
import 'package:serv_me/pages/home/main_food-Page.dart';
import 'package:serv_me/utils/app_constants.dart';
import 'package:serv_me/utils/colors.dart';
import 'package:serv_me/utils/dimensions.dart';
import 'package:serv_me/widgets/app_icon.dart';
import 'package:serv_me/widgets/big_text.dart';
import 'package:serv_me/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.icon24,
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.icon24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.icon24,
                  )
                ],
              )),
          Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height20),
                //color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            height: Dimensions.height20 * 5,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    var popularIndex = Get.find<PopularProductController>()
                                        .popularProductList
                                        .indexOf(_cartList[index].product!);
                                    if(popularIndex >= 0){
                                      Get.toNamed(RouteHelper.getPopularFood(popularIndex,"cartpage"));
                                    } else {
                                      var recommendedIndex = Get.find<RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product!);
                                      Get.toNamed(RouteHelper.getrecommendedFood(recommendedIndex,"cartpage"));
                                    }
                                  },
                                  child: Container(
                                    width: Dimensions.height20 * 5,
                                    height: Dimensions.height20 * 5,
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.height10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD_URL +
                                                  cartController
                                                      .getItems[index].img!)),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radious20),
                                      //color: Colors.white
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Expanded(
                                    child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                          text: cartController
                                              .getItems[index].name!,
                                          color: Colors.black54),
                                      SmallText(
                                        text: "spicy",
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                              text: "\$ ${cartController.getItems[index].price.toString()}",
                                              color: Colors.redAccent),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: Dimensions.height10,
                                                bottom: Dimensions.height10,
                                                left: Dimensions.height10,
                                                right: Dimensions.height10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radious20),
                                                color: Colors.white),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(_cartList[index].product!, -1);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width10 / 2,
                                                ),
                                                BigText(
                                                    text: _cartList[index].quantity.toString()), //popularProduct.inCartItem.toString()),
                                                SizedBox(
                                                  width: Dimensions.width10 / 2,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(_cartList[index].product!, 1);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          );
                        });
                  }),
                ),
              ))
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
        return Container(
          height: Dimensions.buttomheightBar,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.widht30,
              right: Dimensions.widht30),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radious20*2),
                topRight: Radius.circular(Dimensions.radious20*2),
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.height20,
                    right: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radious20),
                    color: Colors.white
                ),
                child: Row(
                  children: [

                    SizedBox(width: Dimensions.width10/2,),
                    BigText(text:  "\$ ${cartController.totalAmount.toString()}"),
                    SizedBox(width: Dimensions.width10/2,),

                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  //popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.height20,
                      right: Dimensions.height20),

                  child: BigText(text: "Check out", color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radious20),
                      color: AppColors.mainColor
                  ),
                ),
              )
            ],
          ),
        );
      },),
    );
  }
}
