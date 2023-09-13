import 'package:get/get.dart';
import 'package:serv_me/pages/cart/cart_page.dart';
import 'package:serv_me/pages/food/popular_food_detail.dart';
import 'package:serv_me/pages/home/main_food-Page.dart';

import '../pages/food/recommended_food.dart';
import '../pages/home/home_page.dart';
import '../pages/splash/splash_screen.dart';

class RouteHelper{
  static const String spalshScreen = "/spalash-screen";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getspalashScreen()=> '$spalshScreen';
  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId, String page)=> '$popularFood?pageId=$pageId&page=$page';
  static String getrecommendedFood(int pageId, String page)=> '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [

    GetPage(name: spalshScreen, page: ()=> SpalshScreen()),

    GetPage(name: initial, page: ()=> HomePage()),

    GetPage(name: popularFood , page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return PopularFoodDetail(pageId: int.parse(pageId!), page:page!);
    },
      transition: Transition.fadeIn,
    ),

    GetPage(name: recommendedFood , page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return RecommendedFoodDetail(pageId: int.parse(pageId!), page:page!);
    },
      transition: Transition.fadeIn,
    ),
    GetPage(name: cartPage, page: () {
      return CartPage();
    },
    transition: Transition.fadeIn
    )
  ];
}