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
    Brand? selectedBrand = Brand(id: 0, name: "");
    return Container(
      padding: EdgeInsets.all(30),
       child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product!.productName, style: Theme.of(context).textTheme.labelLarge,),
                      SizedBox(
                        height: 5,
                      ),
                      Text(product!.price, style: Theme.of(context).textTheme.labelMedium,),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          for(var item in product!.colors) Text(item.name)
                        ],

                        /*product!.colors.map((data) => RadioListTile(
                      title: Text("${data.name}"),
                      groupValue: 0,
                      value: data.index,
                      onChanged: (val) {
                        // setState(() {
                        //   radioItem = data.name ;
                        //   id = data.index;
                        //   _selectedRadioIndex = val;
                        // });
                      },
                    )).toList(),*/
                      ),
                      DropdownButton<Brand>(
                        items: product!.brands.map((items) {
                          return DropdownMenuItem<Brand>(value: items, child: Text(items.name));
                        }).toList(),
                        onChanged: (newValue) {
                          selectedBrand = newValue;
                          //productController!.onBrandChanged(newValue);
                        },
                        value: product!.brands[0],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 150,
                        child:TextField(
                          controller: TextEditingController(),
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              hintText: 'Enter Qty'),
                        ),
                      ),

                    ],
                  ) ,
                ),


              ],
            ),
          ],
        )
    );

  }
}
