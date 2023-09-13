import 'dart:convert';

import 'package:serv_me/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo{
   final SharedPreferences sharedPreferences;
   CartRepo({required this.sharedPreferences});

   List<String> cart = [];

   void addToCart(List<CartModel> cartList){
     cart = [];

     //convert objects to string because shared perfrence only accept the strings
     cartList.forEach((element) {
        return cart.add(jsonEncode(element));
     });

     sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
     //print(sharedPreferences.getStringList("Cart-List"));
   }

   List<CartModel> getCartList(){
     List<String> carts=[];
     if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
     }
     List <CartModel> cartList = [];

     carts.forEach((element) {
       //cartList.add()
     });

     return cartList;
   }
}