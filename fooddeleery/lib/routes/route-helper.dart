


import 'package:fooddeleery/pages/food/popular_food_detail.dart';
import 'package:fooddeleery/pages/home/main-food-page.dart';
import 'package:get/get.dart';

import '../pages/food/recomended_dood_detail.dart';

class RouteHelper{


  static String initialRoute = "/";
  static const String popularFoodroute ="/popular-food";
  static const String recommendedFoodroute ="/recomended-food";

  // static String 000 ()=> '$popularFood';


static List<GetPage> routes =[
  GetPage(name: "/", page: ()=>const MainFoodPage()),
  GetPage(name: popularFoodroute, page:(){  var pageId =   Get.parameters['pageId'] ;
   return PopularFoodDetail(pageId:int .parse(pageId!));}),
  GetPage(name: recommendedFoodroute, page: (){
var pageId = Get.parameters['pageId'];
    return  RecommenedFood(pageId:int.parse(pageId!));
  },transition: Transition.fadeIn),



];

  static String getpopularFoodroute(int pageId) =>'$popularFoodroute?pageId=$pageId';

  static String getRecomendedFood(int pageId) =>'$recommendedFoodroute?pageId=$pageId';
}