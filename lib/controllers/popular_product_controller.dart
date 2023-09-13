import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serv_me/controllers/cart_controller.dart';
import 'package:serv_me/data/repository/popular_product_repo.dart';
import 'package:serv_me/models/products_model.dart';
import 'package:serv_me/utils/colors.dart';

import '../models/cart_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quntity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;

  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      //print(_popularProductList);
      update();
    } else {

    }
  }

  void setQuntity(bool isIncrement){
    if(isIncrement){
      //print("tap" + _quanity.toString());
      _quantity = checkQuantity(_quantity+1);
    } else {
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }

  int checkQuantity(int quantity){
    if((_inCartItem+quantity) <0){
      Get.snackbar("item Count", "You Can't reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if(_inCartItem>0){
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else if((_inCartItem+quantity)>20){
      Get.snackbar("item Count", "You Can't add more item!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initproduct(ProductModel product, CartController cart){
    _quantity=0;
    _inCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    //if exixt
    //get from storage _inCartItem
    if(exist){
      _inCartItem = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product){
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCartItem = _cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        print("the id is "+value.id.toString()+" The quantity is "+value.quantity.toString());
      });
    update();
    }

    int get totalitems{
    return _cart.totalItems;
    }

    List<CartModel> get getItems{
    return _cart.getItems;
    }
  }
//}