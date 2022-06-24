import 'dart:ui';

class ProductModel {
 late String name, image, job,description, price;


  ProductModel(
      {required this.name,
        required this.image,
        required this.job,
        required this.description,
        required this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    job = map['job'];
    description = map['description'];
    price = map['price'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'job': job,
      'description': description,
      'price': price,
    };
  }
}