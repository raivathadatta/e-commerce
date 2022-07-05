

// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fooddeleery/controller-repository/app-constants.dart';
import 'package:fooddeleery/controller-repository/controller/cart-controller.dart';
import 'package:fooddeleery/pages/home/main-food-page.dart';
import 'package:fooddeleery/utils/app-colors.dart';
import 'package:fooddeleery/widgets/app_column.dart';
import 'package:fooddeleery/widgets/app_icon.dart';
import 'package:fooddeleery/widgets/icon_text.dart';
import 'package:get/get.dart';


import '../../controller-repository/controller/popular_products-controller.dart';

import '../../widgets/bigtext.dart';
import '../../widgets/expandedble_text.dart';

import '../../widgets/smalltext.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId ;
   PopularFoodDetail({Key? key,required this.pageId}) : super(key: key);


  @override
  Widget build(BuildContext context) {

  var product = Get.find<PopularProductController>().popularProduct![pageId];
  Get.find<PopularProductController>().initProduct(Get.find<CartController>(),product);
  print(pageId);
  print(product.name);
    var AppConstants;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 400,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      AppConstants.getImagesUrl + product.img!)),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                GestureDetector(onTap: (){
                  Get.to(()=>MainFoodPage());
                },
                  child: const AppIcon(icon: Icons.arrow_back_ios),),
               
               
               
                GetBuilder<PopularProductController>(builder: ((controller) {
                  
                  return Stack(
                    children: [
                      AppIcon(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems>=1?
                       Positioned(
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
                }))
              ],
            ),
          ),
          Positioned(
            left: 0,
            right : 0,
            top: 400,
            child: Container(
              padding:const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                   AppColumn(product.name!),
                const  SizedBox(
                    height: 20,
                  ),
                  BigText(text: product.description!),
                    const  SizedBox(
                    height: 20,
                  ),
                 Expanded(
                  child: SingleChildScrollView(
                    child: ExpandableTextWidget(
                          text:
                            product.description!),
                  ),
                )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "food text"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 15,
                              )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Smalltext(text: "4.5"),
                    const SizedBox(
                      height: 10,
                    ),
                    Smalltext(text: "1247"),
                    const SizedBox(
                      height: 10,
                    ),
                    Smalltext(text: "commonts"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    IconsAndTextWidget(
                        icon: Icons.circle,
                        text: "Normal",
                        iconColoe: Colors.pink),
                    IconsAndTextWidget(
                        icon: Icons.location_city,
                        text: "1.0km",
                        iconColoe: Colors.blue),
                    IconsAndTextWidget(
                        icon: Icons.access_time_filled,
                        text: "2.03h",
                        iconColoe: Colors.red),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar:GetBuilder<PopularProductController>(builder: (populaProduct){
        return  Container(
        height: 120,
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                children: [
                   GestureDetector( onTap:()=> populaProduct.setQuantity(false), child: const Icon(Icons.remove)),
                  const SizedBox(
                    width: 5,
                  ),
                  BigText(text:  "${populaProduct.inCartitems}" ),
                  const SizedBox(
                    width: 5,
                  ),
                 GestureDetector( onTap:()=> populaProduct.setQuantity(true), child: const Icon(Icons.add)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: 20,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: GestureDetector(
                onTap: (){
                  populaProduct.additem(product);
                },
                child: BigText(
                  text: '10 add to cart',
                ),
              ),
            )
          ],
        ),
      );
      },)
    );
  }
}
