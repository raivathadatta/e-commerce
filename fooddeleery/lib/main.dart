import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fooddeleery/controller-repository/app-constants.dart';
import 'package:fooddeleery/controller-repository/controller/cart-controller.dart';
import 'package:fooddeleery/data/api/api-client.dart';
import 'package:fooddeleery/pages/home/main-food-page.dart';
import 'package:fooddeleery/routes/route-helper.dart';
import 'package:get/get.dart';

import 'controller-repository/controller/popular_products-controller.dart';
import 'controller-repository/controller/recomended_product-controller.dart';
import 'controller-repository/repositorues/cart-repo.dart';
import 'controller-repository/repositorues/popular-products-repo.dart';
import 'controller-repository/repositorues/recomended-proded-repo.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
Get.lazyPut(() => PopularProductController( popularProductrepo: Get.find()));
Get.lazyPut(() => PopularProductrepo(appicalient: Get.find()));

Get.lazyPut(() => ApiClient(appBAseUrl:AppConstants.Base_Url));

Get.lazyPut(() => RecomendedProductrepo(appicalient: Get.find()));
Get.lazyPut(() => RecomendedProductController(recomendedProductrepo: Get.find()));

// Get.lazyPut(() => CartRepo(appicalient: Get.find()));
 Get.lazyPut(() => CartRepo());
Get.lazyPut(() => CartController(cartRepo: Get.find()));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getpopularPodutList();
    Get.find<RecomendedProductController>().getpopularPodutList();
     log("one++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    return  GetMaterialApp(
      title: 'Foodee', 
     
      
      // ignore: prefer_const_constructors
      home:  MainFoodPage(),
      initialRoute: RouteHelper.initialRoute,
      getPages: RouteHelper.routes,
    );
  }
}
