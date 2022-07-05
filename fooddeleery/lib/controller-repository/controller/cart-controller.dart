
import 'package:fooddeleery/models/cart.dart';
import 'package:fooddeleery/models/product.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../repositorues/cart-repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  void additems(ProductModel product, int quantity) {


var totalquntity =0;

      if(_items.containsKey(product.id)){
       
          _items.update(product.id!, (value) { 

             totalquntity = value.quantity!+quantity;

            return CartModel(
            id: product.id,
            img: product.img,
            isExit: true,
            name: product.name,
            price: product.price,
            quantity:value.quantity! + quantity,
            time: DateTime.now().toString());
            
            
           });
       if(totalquntity<=0){
              _items.remove(product.id);
            }
      }else{

        if(quantity>0){
_items.putIfAbsent(
        product.id!,
        () => CartModel(
            id: product.id,
            img: product.img,
            isExit: true,
            name: product.name,
            price: product.price,
            quantity: quantity,
            time: DateTime.now().toString()));
        }else{
          Get.snackbar("error", "add atleast one item in cart");
        }
 
      }

   
  }




existIncart(ProductModel productModel){
  if(_items.containsKey(productModel.id)){
    return true;
  }else{
    return false;
  }
}

int geQuantity(ProductModel product){

  var quantity =0;
  if(_items.containsKey(product.id)){
    _items.forEach((key, value) {
      if(key == product.id){
      quantity = value.quantity!;
      }
    });
  }

  return quantity;
}

int get totalItes{
  var totalquntity =0;
  _items.forEach((key, value) {
    totalquntity += value.quantity!;
  });
return totalquntity;
}


List<CartModel> get getItems{
  return _items.entries.map((e) {
    return e.value;
  }).toList();
}

}
