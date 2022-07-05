import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/material.dart';
import 'package:fooddeleery/controller-repository/app-constants.dart';
import 'package:fooddeleery/controller-repository/controller/popular_products-controller.dart';
import 'package:fooddeleery/controller-repository/controller/recomended_product-controller.dart';
import 'package:fooddeleery/routes/route-helper.dart';
import 'package:fooddeleery/utils/app-colors.dart';
import 'package:fooddeleery/widgets/bigtext.dart';
import 'package:fooddeleery/widgets/icon_text.dart';
import 'package:fooddeleery/widgets/smalltext.dart';
import 'package:get/get.dart';

class FoodpageBody extends StatefulWidget {
  const FoodpageBody({Key? key}) : super(key: key);

  @override
  State<FoodpageBody> createState() => _FoodpageBodyState();
}

class _FoodpageBodyState extends State<FoodpageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPage = 0.0;
  var scaleFactor = 0.8;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        GetBuilder<PopularProductController>(
          builder: (popularPoducts) {
            log("llllllllllllllllllllllllllllllllllllllllllllllll");
            log(popularPoducts.popularProduct!.length.toString());
            return SizedBox(
              height: 330,

              child: PageView.builder(
                controller: pageController,
                itemCount: popularPoducts.popularProduct!.length,
                itemBuilder: (context, index) {
                  return _buildPageitem(index,popularPoducts);
                },
              ),
              // ),
            );
          },
        ),
        GetBuilder<PopularProductController>(
          builder: (popularPoducts) {
            return DotsIndicator(
              dotsCount: 5,
              position: currentPage,
              decorator: const DotsDecorator(
                color: Colors.black87, // Inactive color
                activeColor: Colors.redAccent,
              ),
            );
          },
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.red,
          height: 30,
          margin: const EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recomended"),
              const SizedBox(width: 10),
              Container(
                height: 15,
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 15,
                margin: const EdgeInsets.only(bottom: 2),
                child: Smalltext(text: "FoodParing"),
              ),
            ],
          ),
        ),
      

        GetBuilder<RecomendedProductController>(builder: (recomendedProduct) {
          log("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");

          return SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: recomendedProduct.recomendedProductsList!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getRecomendedFood(index));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white38,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(AppConstants.getImagesUrl +
                                    recomendedProduct
                                        .recomendedProductsList![index].img!),),

                            //
                            ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(children: [
                              BigText(text: recomendedProduct.recomendedProductsList![index].name!),
                              Smalltext(text: recomendedProduct.recomendedProductsList![index].name!),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  IconsAndTextWidget(
                                      icon: Icons.circle,
                                      text: "Normal",
                                      iconColoe: Colors.pink),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  IconsAndTextWidget(
                                      icon: Icons.location_city,
                                      text: "1.0km",
                                      iconColoe: Colors.blue),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  IconsAndTextWidget(
                                      icon: Icons.access_time_filled,
                                      text: "2.03h",
                                      iconColoe: Colors.red),
                                ],
                              )
                            ]),
                          ),
                        ),
                      )
                    ]),
                  ),
                );
              },
            ),
          );
        }),
        // : const CircularProgressIndicator();
        // }),
      ]),
    );
  }

// }
  Widget _buildPageitem(int index, PopularProductController popularPoducts) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == currentPage.floor()) {
      var currScale = 1 - (currentPage - index) * (1 - scaleFactor);
      var currTruns = 220 * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTruns, 1);
    } else if (index == currentPage.floor() + 1) {
      var currScale =
          scaleFactor + (currentPage - index + 1) * (1 - scaleFactor);
      var currTruns = 220 * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTruns, 1);
    } else if (index == currentPage.floor() - 1) {
      var currScale = 1 - (currentPage - index) * (1 - scaleFactor);
      var currTruns = 220 * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTruns, 1);
    } else {
      var currScale = 0.0;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, 220 * (1 - scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Get.toNamed(RouteHelper.getpopularFoodroute(index)),
            child: Container(
              height: 220,
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Colors.black : Colors.yellow,
                // ignore: prefer_const_constructors
                // image:  AssetImage("assets/image/food1.png"),
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.getImagesUrl+  popularPoducts.popularProduct![index].img!),
                ),
              ),
              // padding: EdgeInsets.,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x00ffe8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  )
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
