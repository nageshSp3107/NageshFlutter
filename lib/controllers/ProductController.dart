import 'dart:convert';

import 'package:get/get.dart';

import '../models/product.dart';
import 'package:flutter/services.dart' as rootBundle;


class ProductController extends GetxController{
  var products = <Product>[].obs;
  var productsBrand = <Product>[].obs;
  var brandName = "".obs;

  @override
  onInit(){
     readJsonData();
     super.onInit();
  }

  void readJsonData() async {
    //read json file
    final jsondata = await rootBundle.rootBundle.loadString('assets/jsonFile/Products.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;
    products.value = list.map((e) => Product.fromJson(e)).toList();
  }

  onBrandChanged(var brand){
    brandName.value =  brand;
  }


  @override
  void dispose() {
    super.dispose();
    products.clear();
  }

}