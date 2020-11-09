
import 'package:flutter/material.dart';

import '../../main.dart';
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
    return Card(
      // elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Text('NV'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(selectedProduct.name),
                        Text(''+ selectedProduct.category.toString().split('.').last)
                      ],
                    ),
                  ),
                ),
                //selectedProduct.isFeatured ? Icon(Icons.star_border) : Container(),
                Opacity(
                  opacity: selectedProduct.isFeatured ? 1.0 : 0.0,
                  child: Icon(Icons.star_border),
                ),
                Visibility(
                  visible: selectedProduct.isFeatured,
                  child: Icon(Icons.star_border),
                ),
                if (selectedProduct.isFeatured) Icon(Icons.star_border),
                if(selectedProduct.isFeatured) Text('Showing') else Text('Not showing')
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'This is an article, trying to explain custom callbacks inside custom widgets.'
                    ' Let\'s just add some more text just to make it a bulky description.',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

}