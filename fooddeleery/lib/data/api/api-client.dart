
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;

import '../../controller-repository/app-constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBAseUrl;
  late Map<String, String> _mainheader;
  ApiClient({required this.appBAseUrl}) {
    baseUrl = appBAseUrl;
    // timeout = const Duration(seconds: 30)/;
    token =AppConstants.TOKEN;
    _mainheader = {
      'Content-type': 'application/json; chareset=UTF-8',
      'Authorization': 'Barer $token'
    };
  }

  Future<dynamic> getData(String uri) async{
print(uri);
       try{
        
      var response= await http.get(Uri.parse(uri));
         print(response.statusCode);
      
         return response;
    }catch(e){
     
      print(e.toString());
  
return  Response(statusCode: 1 , statusText: e.toString());
    }
  }
}
