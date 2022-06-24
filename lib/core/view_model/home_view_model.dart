import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/product_model.dart';
import '../../model/category_model.dart';
import '../services/home_services.dart';

class HomeViewModel extends GetxController{
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];
  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

HomeViewModel(){
  getCategory();
  getBestWorker();
}
  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add( CategoryModel.fromJson(
          value[i].data() as Map<String,dynamic>,
        ));
        _loading.value = false;
      }
      update();
    });
  }
  getBestWorker() async {
    _loading.value = true;
    HomeService().getBestWorker().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(
            value[i].data() as Map<String,dynamic>));
        _loading.value = false;
      }
      print(_productModel.length);
      update();
    });
  }
}