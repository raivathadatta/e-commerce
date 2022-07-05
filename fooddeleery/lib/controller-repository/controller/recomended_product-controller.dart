

import 'dart:convert';

import 'package:fooddeleery/controller-repository/repositorues/recomended-proded-repo.dart';
import 'package:fooddeleery/models/product.dart';
import 'package:get/get.dart';

class RecomendedProductController extends GetxController{
  final RecomendedProductrepo recomendedProductrepo;
  RecomendedProductController( {required this. recomendedProductrepo});
  List<ProductModel>?_recomendedProductList=[];
  List<ProductModel>? get recomendedProductsList=>_recomendedProductList;
bool _isload=false;
bool get isloading=>_isload;

  Future<void> getpopularPodutList() async {
    var response =await  recomendedProductrepo.getrecomendedProductList();
  
  if(response.statusCode==200){
    
    _recomendedProductList =[];
    _recomendedProductList?.addAll(Product.fromJson(jsonDecode(response.body) as Map<String, dynamic>).products!);


    print(_recomendedProductList!.length);
    
   _isload=true;
    update();
  }
  else{
    // returne3`c
  
    print("in error ");
  }
 }

 
}