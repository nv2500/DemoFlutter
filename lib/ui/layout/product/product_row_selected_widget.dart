
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/data/colors.dart';

import '../../../main.dart';
import 'product_row_base_widget.dart';

// ignore: must_be_immutable
class ProductRowSelectedWidget extends ProductRowBaseWidget {

  const ProductRowSelectedWidget({
    selectedProduct,
    rowIndex,
    // tapCallback,
  })  : super(
          selectedProduct: selectedProduct,
          rowIndex: rowIndex,
          tapCallback: null,
        );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // return Card(
    //   // elevation: 4.0,
    //   child:
    Widget newrow =
      Padding(
        padding: EdgeInsets.all(12.0),
        child: //Column(
          //children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: DemoColors.billColor(selectedProduct.id),
                  child: Text(
                    selectedProduct.name.characters.first,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Text('Quantity: ${selectedProduct.quantity} x',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.subtitle1.copyWith(
                                fontSize: 16,
                                color: DemoColors.gray,
                              ),
                            ),
                            Expanded(child: SizedBox(),),
                            Text('\$'+ selectedProduct.price.toString(),
                              style: textTheme.subtitle1.copyWith(
                                fontSize: 16,
                                color: DemoColors.gray,
                              ),
                            )
                          ],
                        ),
                        Text(selectedProduct.name,
                          style: textTheme.bodyText2.copyWith(
                            // fontSize: 20,
                            color: DemoColors.gray,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                /*Opacity(
                  opacity: selectedProduct.isFeatured ? 1.0 : 0.0,
                  child: Icon(Icons.star_border),
                ),
                Visibility(
                  visible: selectedProduct.isFeatured,
                  child: Icon(Icons.star_border),
                ),
                if (selectedProduct.isFeatured) Icon(Icons.star_border),
                if(selectedProduct.isFeatured) Text('Showing') else Text('Not showing')*/
                // Text('x \$${selectedProduct.price}'),
                // Text('\$'+ selectedProduct.price.toString(),
                //   style: textTheme.subtitle1.copyWith(
                //     fontSize: 16,
                //     color: DemoColors.gray,
                //   ),
                // )
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 8.0),
            //   child: Text(
            //     'This is an article, trying to explain custom callbacks inside custom widgets.'
            //         ' Let\'s just add some more text just to make it a bulky description.',
            //     textAlign: TextAlign.justify,
            //     style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),
            //   ),
            // ),
          // ],
        // ),
      // ),
    );

    Widget x = Column(
      children: [
        newrow,
        const Divider(
          height: 2,
          indent: 16,
          endIndent: 16,
          color: DemoColors.dividerColor,
        ),
      ],
    );

    return x;
  }

}