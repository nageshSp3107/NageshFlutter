import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nagesh_flutter/controllers/ProductController.dart';
import 'package:nagesh_flutter/src/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProductsPage(),
    );
  }
}

class ProductsPage extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product Lists',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: GetX<ProductController>(
                  builder: (productController) {
                    return ListView.builder(
                        itemCount: productController.products.length,
                        itemBuilder: (context, index){
                          var product = productController.products[index];
                          return ProductItem(product: product);
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
