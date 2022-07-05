
import 'package:fooddeleery/data/api/api-client.dart';
import 'package:get/get.dart';

class PopularProductrepo extends GetxService {
  final ApiClient appicalient;

  PopularProductrepo({required this.appicalient});
  Future<dynamic> getpopularProductList() async {
    return await appicalient.getData("https://mvs.bslmeiyu.com/api/v1/products/popular");
  }
}
