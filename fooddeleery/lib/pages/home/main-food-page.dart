
import 'package:flutter/material.dart';
import 'package:fooddeleery/pages/home/food-page-body.dart';
import 'package:fooddeleery/utils/app-colors.dart';
import 'package:fooddeleery/widgets/bigtext.dart';
import 'package:fooddeleery/widgets/smalltext.dart';



class MainFoodPage extends StatefulWidget {
  
  const MainFoodPage({Key? key}) : super(key: key);
 
  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                BigText(
                  text: 'country',
                  color: AppColors.mainColor,
                  size: 30,
                ),
                Row(
                  children: [
                    Smalltext(
                      text: 'city',
                      color: Colors.black54,
                    ),
                    const Icon(Icons.arrow_drop_down_circle_rounded),
                  ],
                )
              ],
            ),
            Center(
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
             Expanded(
                // child: SingleChildScrollView(
              child: FoodpageBody(),
            // )
            )

          ],
            ),
          ),
        ],
      ),
    );
  }
}
