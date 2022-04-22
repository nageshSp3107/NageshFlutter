import 'package:flutter/material.dart';
import 'package:nagesh_flutter/models/product.dart';

class OrderItem extends StatelessWidget {
  final Product? product;
  OrderItem({this.product});

  @override
  Widget build(BuildContext context) {

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
                      Text('Qty: ', style: Theme.of(context).textTheme.labelMedium,),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Selected Color: ${product?.selectedColor?.split(".")[1] ?? ''}', style: Theme.of(context).textTheme.labelMedium,),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Selected Brand: ${product!.selectedBrand}', style: Theme.of(context).textTheme.labelMedium,),
                      SizedBox(
                        height: 5,
                      ),
                      Text(product!.price, style: Theme.of(context).textTheme.labelMedium,),
                      SizedBox(
                        height: 5,
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
