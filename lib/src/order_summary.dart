import 'package:flutter/material.dart';
import 'package:nagesh_flutter/models/product.dart';
import 'package:nagesh_flutter/src/order_item.dart';
import 'package:get/get.dart';


class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  var products = Get.arguments[1] as List<Product>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order Summary'),
      ),
      body: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: products.length,
          itemBuilder: (context, index){
            var product = products[index];
            return OrderItem(product: product);
          }),
    );
  }
}
