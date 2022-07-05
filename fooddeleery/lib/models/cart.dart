class CartModel {
  int? id;
  String? name;

  int? price;

  String? img;
  int? quantity;
  bool? isExit;
  String? time;

  CartModel(
      {this.id,
      this.img,
      this.name,
      this.price,
      this.isExit,
      this.quantity,
      this.time});

  // Iterable get product => ;

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    price = json['price'];

    img = json['img'];
    quantity=json['quantity'];
    isExit=json['isExist'];
    time= json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;

    data['price'] = price;

    data['img'] = img;

    return data;
  }
}
