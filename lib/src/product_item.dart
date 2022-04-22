import 'package:flutter/material.dart';
import 'package:nagesh_flutter/models/product.dart';
import 'package:nagesh_flutter/controllers/ProductController.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final Product? product;
  final ProductController? productController;

  ProductItem({this.product, this.productController});

  @override
  Widget build(BuildContext context) {
    Brand? selectedBrand = product!.brands[0];
    TextEditingController textController = TextEditingController();

    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 30,
                  // backgroundImage: NetworkImage(product!.picture),

                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product!.productName, style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge,),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Price: ${product!.price}', style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium,),
                      Row(
                        children: <Widget>[
                          for(var i = 0; i < product!.colors.length; i++)
                            addRadioButton(i, product!.colors[i].name)
                        ],
                      ),
                      GetBuilder<ProductController>(builder: (productController) {
                        if(productController.brandName.value == null || productController.brandName.value.id ==null){
                          selectedBrand = product!.brands[0];
                        }else{
                          selectedBrand = productController.brandName.value;
                        }
                        var index = 0;
                        product!.brands.forEach((element) {
                          if(element.name == selectedBrand!.name){
                            index++;
                          }
                        });
                        return DropdownButton<Brand>(
                          items: product!.brands.map((items) {
                            return DropdownMenuItem<Brand>(
                                value: items, child: Text(items.name!));
                          }).toList(),
                          onChanged: (newValue) {
                            productController.onBrandChanged(product!, newValue!);
                          },
                          value: product!.brands[index],
                        );
                      }),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          controller: textController,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 1.0),
                              ),
                              hintText: 'Enter Qty'),
                          onChanged: (value) {
                            // set the value in to controller
                          },
                        ),
                      ),

                    ],
                  ),
                ),


              ],
            ),
          ],
        )
    );
  }

  Row addRadioButton(int btnIndex, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GetBuilder<ProductController>(
            builder: (_) =>
                Radio(
                    activeColor: Colors.blue,
                    value: product!.colors[btnIndex],
                    groupValue: productController!.selectedColor.value,
                    onChanged: (value) =>
                        productController!.onClickRadioButton(product!, value))
        ),
        Text(title)
      ],
    );
  }
}
