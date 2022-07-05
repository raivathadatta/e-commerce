import 'package:flutter/material.dart';
import 'package:fooddeleery/controller-repository/app-constants.dart';
import 'package:fooddeleery/controller-repository/controller/popular_products-controller.dart';
import 'package:fooddeleery/routes/route-helper.dart';
import 'package:fooddeleery/utils/app-colors.dart';
import 'package:fooddeleery/widgets/bigtext.dart';
import 'package:get/get.dart';

import '../../controller-repository/controller/cart-controller.dart';
import '../../controller-repository/controller/recomended_product-controller.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/expandedble_text.dart';

class RecommenedFood extends StatelessWidget {
  int pageId;
  RecommenedFood({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var producct =
        Get.find<RecomendedProductController>().recomendedProductsList![pageId];
        Get.find<PopularProductController>().initProduct(Get.find<CartController>(),producct);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.initialRoute);
                    },
                    child: const Icon(Icons.clear)),


                    ////add cart 
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
              ]
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              // ignore: avoid_unnecessary_containers
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                color: Colors.white,
                child: BigText(text: producct.name!, size: 26),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.yellow,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image(
              image: NetworkImage(AppConstants.getImagesUrl + producct.img!),
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: ExpandableTextWidget(text: producct.name!)),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: ((controller) {
        return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 GestureDetector(
                  onTap: () {
                    controller.setQuantity(false);
                  },
                   child:const AppIcon(
                    icon: Icons.remove,
                    backGrondColor: AppColors.mainColor,
                    iconsize: 28,
                                 ),
                 ),
                BigText(
                  text: "\\ ${producct.price} x ${controller.inCartitems}",
                  color: Colors.black,
                  size: 26,
                ),
                 GestureDetector(
                  onTap: (() {
                    controller.setQuantity(true);
                  }),
                   child: const AppIcon(
                    icon: Icons.add,
                    backGrondColor: AppColors.mainColor,
                    iconsize: 28,
                                 ),
                 ),
              ]
            ),
          ),
          Container(
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
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                      size: 45,
                    )),
                GestureDetector(
                  onTap: (){
                    controller.additem(producct);
                  },
                  child: Container(
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
                    child: BigText(
                      text: ' ${producct.price! * controller.inCartitems} |Add to Cart',color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
      }),)
    );
  }
}
