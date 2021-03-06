import 'package:flutter/material.dart';
import 'package:flutter_app/business_logic/models/product.dart';
import 'package:flutter_app/business_logic/view_models/products_viewmodel.dart';

typedef TapCallback = void Function(int);

// ignore: must_be_immutable
class ProductRowBaseWidget extends StatelessWidget {

  // non final or const constructor to keep everything simple due
  // we will use generic typedef for dynamic of ListView contents
  final ProductViewPresentation selectedProductVP;
  final int rowIndex;
  final ProductsViewModel viewModel;

  // final TapCallback tapCallback;

  const ProductRowBaseWidget({
    this.viewModel,
    this.selectedProductVP,
    this.rowIndex,
    // this.tapCallback,
  });// :  assert(selectedProduct != null);
        // assert(tapCallback != null);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}
