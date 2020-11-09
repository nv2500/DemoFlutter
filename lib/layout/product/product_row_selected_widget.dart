
import 'package:flutter/material.dart';

import '../../main.dart';
import 'product_row_base_widget.dart';

// ignore: must_be_immutable
class ProductRowSelectedWidget extends ProductRowBaseWidget {

  @override
  Widget build(BuildContext context) {
    // final alreadySaved = MyDemoApp.sSavedProductList.contains(selectedProduct);  // NEW

    Widget row = Card(
        child: ListTile(
          title: Text(
            selectedProduct.nameTesting,
            // style: biggerFont,
          ),
          // trailing: Icon(
          //   alreadySaved ? Icons.favorite : Icons.favorite_border,
          //   color: alreadySaved ? Colors.red : null,
          // ),
          onTap: () {
            // // update saving state of selected product
            // if (alreadySaved) {
            //   MyDemoApp.sSavedProductList.remove(selectedProduct);
            // } else {
            //   MyDemoApp.sSavedProductList.add(selectedProduct);
            // }
            // // TODO call this to force invalidate UI
            // tapCallback(selectedProduct.id);
          },
        ));
    return row;
  }

}