import 'package:flutter/material.dart';
import 'package:flutter_app/model/product.dart';

typedef TapCallback = void Function(int);

// ignore: must_be_immutable
class ProductRowBaseWidget extends StatelessWidget {

  // non final or const constructor to keep everything simple due
  // we will use generic typedef for dynamic of ListView contents
  Product selectedProduct;
  int rowIndex;

  TapCallback tapCallback;

  // const ProductRowBaseWidget({
  //   this.selectedProduct,
  //   this.index,
  //   this.tapCallback,
  // }) :  assert(selectedProduct != null),
  //       assert(tapCallback != null);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}
