import 'dart:convert';

import 'package:get/get.dart';

import '../models/product.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/material.dart';



class ProductController extends GetxController{
  var products = <Product>[].obs;
  var productsBrand = <Product>[].obs;
  var brandName = Brand().obs;
  var selectedColor = Color.BLUE.obs;
  List<Product>? productList;
  TextEditingController textController = TextEditingController();

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
    productList = list.map((e) => Product.fromJson(e)).toList();
    products.value = productList!;
  }

  void onBrandChanged(Product? product,Brand brand){
    productList!.forEach((element) { if(element.id == product!.id){
      brandName.value = brand;
      element.selectedBrand = brand.name;
    }
    });
    update();
  }


  void onClickRadioButton(Product? product, value) {
    productList!.forEach((element) { if(element.id == product!.id){
      selectedColor.value = value;
      element.selectedColor = value.toString();
    }
    });
    update();
  }

  @override
  void dispose() {
    super.dispose();
    products.clear();
    productsBrand.clear();
    selectedColor.close();
    brandName.close();
    textController.dispose();
  }

}