
import 'package:flutter/material.dart';
import 'package:flutter_app/model/product.dart';

import '../../main.dart';

class ProductRowSelectFavWidget extends StatelessWidget {

  final Product selectedProduct;
  final int index;
  final VoidCallback tapCallback;

  const ProductRowSelectFavWidget({
    this.selectedProduct,
    this.index,
    this.tapCallback,
  }) :  assert(selectedProduct != null),
        assert(tapCallback != null);

  @override
  Widget build(BuildContext context) {
    final alreadySaved = MyDemoApp.sSavedProductList.contains(selectedProduct);  // NEW

    Widget row = Card(
        child: ListTile(
          title: Text(
            selectedProduct.nameTesting,
            // style: biggerFont,
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
          onTap: () {
            // update saving state of selected product
            if (alreadySaved) {
              MyDemoApp.sSavedProductList.remove(selectedProduct);
            } else {
              MyDemoApp.sSavedProductList.add(selectedProduct);
            }
            // TODO call this to force invalidate UI
            tapCallback();
          },
        ));
    return row;
  }

}