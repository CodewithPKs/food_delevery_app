import 'package:get/get.dart';
class Dimensions{

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight/2.64;
  static double pageViewContainer = screenHeight/3.84;
  static double pageViewTextContainer = screenHeight/7.03;

  //dynamic height for padding and margin
  static double height10 = screenHeight/84.4;
  static double height15 = screenHeight/56.27;
  static double height20 = screenHeight/42.2;
  static double height30 = screenHeight/28.13;
  static double height45 = screenHeight/18.76;

  //dynamic width for padding and marigin
  static double width10 = screenHeight/84.4;
  static double width15 = screenHeight/56.27;
  static double width20 = screenHeight/42.2;
  static double widht30 = screenHeight/28.13;

  //dynamic height for font sze and radious

  static double font20 = screenHeight/42.2;
  static double font16 = screenHeight/52.7;
  static double font26 = screenHeight/32.46;


  static double radious15 = screenHeight/56.27;
  static double radious20 = screenHeight/42.2;
  static double radious30 = screenHeight/28.13;

  //iicon size
  static double icon24 = screenHeight/35.17;
  static double icon16 = screenHeight/52.75;
  static double icon250 = screenHeight/3.38;

  //list viwe Size
  static double listViewImgSize = screenWidth/3.25;
  static double listViewTextCountSize = screenWidth/3.9;

  //popular food details
  static double popularfoodImgSize = screenHeight/2.41;

  //bottom Height
  static double buttomheightBar = screenHeight/7.03;
}