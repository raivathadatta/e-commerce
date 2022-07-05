
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeleery/routes/route-helper.dart';
import 'package:fooddeleery/utils/app-colors.dart';
import 'package:fooddeleery/widgets/app_icon.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller-repository/controller/popular_products-controller.dart';
import '../../widgets/bigtext.dart';

class CartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Stack(children: [
        Positioned(
          left: 20,
          top: 60,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
children:  [
  AppIcon(icon: Icons.home,backGrondColor: AppColors.mainColor,iconsize:24 ,),

 
  SizedBox(width: 100,),


  GestureDetector( onTap: (){
    Get.toNamed(RouteHelper.initialRoute);
  }, child: AppIcon(icon: Icons.arrow_back_ios,backGrondColor: AppColors.mainColor,iconsize:24 ,)),
  
 
   


  GetBuilder<PopularProductController>(builder: ((controller) {
                  
                  return Stack(
                    children: [
                      const AppIcon(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems>=1?
                       const Positioned(
                        right: 0,
                        top: 0,
                        child: AppIcon(icon: Icons.circle,size: 20,iconColor: AppColors.mainColor,)):
                      Container(),


                       Get.find<PopularProductController>().totalItems>=1?
                       Positioned(
                        right: 3,
                        top: 3,
                        child: BigText(text: Get.find<PopularProductController>().quantity.toString(),size: 12,color: Colors.white,)):
                      Container()
                    ],
                  );
                })),



],
        ))
      ]),
    );



  }
  

  
}