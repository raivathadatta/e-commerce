
import 'package:get/get.dart';

import '../../data/api/api-client.dart';

class RecomendedProductrepo extends GetxService {
  final ApiClient appicalient;

  RecomendedProductrepo({required this.appicalient});
  Future<dynamic> getrecomendedProductList() async {
    return await appicalient.getData("https://mvs.bslmeiyu.com/api/v1/products/recommended");
  }
}
