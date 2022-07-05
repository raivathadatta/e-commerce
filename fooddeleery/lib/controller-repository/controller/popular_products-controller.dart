import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fooddeleery/controller-repository/controller/cart-controller.dart';
import 'package:fooddeleery/controller-repository/repositorues/popular-products-repo.dart';
import 'package:fooddeleery/models/cart.dart';
import 'package:fooddeleery/models/product.dart';
import 'package:fooddeleery/utils/app-colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductrepo popularProductrepo;
  PopularProductController({required this.popularProductrepo});
  List<ProductModel>? _popularProductList = [];
  List<ProductModel>? get popularProduct => _popularProductList;
  Map<int, CartModel> _item = {};
  bool _isload = false;
  bool get isloading => _isload;
  int _quantity = 0;
  int get quantity => _quantity;

  int _incartitems = 0;
  int get inCartitems => _incartitems + _quantity;


  late CartController _cart;
  Future<void> getpopularPodutList() async {
    var response = await popularProductrepo.getpopularProductList();

    if (response.statusCode == 200) {
      //  print(response.body);
      _popularProductList = [];

      _popularProductList?.addAll(
          Product.fromJson(jsonDecode(response.body) as Map<String, dynamic>)
              .products!);

      print(_popularProductList!.length);

      _isload = true;
      update();
    } else {
      print("llllllllllll");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  void additem(ProductModel productModel) {
    // if (quantity > 0) {
      _cart.additems(productModel, _quantity);
      _quantity=0;
      _incartitems= _cart.geQuantity(productModel); 
    // } else {
    //   Get.snackbar("Item count ", "you cant reduse more",
    //       backgroundColor: AppColors.mainColor, colorText: Colors.white);
    // }
  }

  int checkQuantity(int quantity) {
    if ((_incartitems+quantity) < 0) {

      if(inCartitems>0){
        _quantity =- _incartitems;
      return quantity;
      }
      return 0;
    } else if ((_incartitems+quantity) > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController find,ProductModel product) {
    _quantity = _incartitems;
    _incartitems = 0;
    _cart = find;
    
  var exist= false;
  exist = _cart.existIncart(product);

  _incartitems=_cart.geQuantity(product);
  }



  int get totalItems{
    return _cart.totalItes;
  }

List<CartModel> get getItems{
  return _cart.getItems;
}
}
