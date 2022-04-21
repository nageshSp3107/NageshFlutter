import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ProductsControllerPage extends StatelessWidget {
  final logic = Get.put(ProductsControllerLogic());
  final state = Get.find<ProductsControllerLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
