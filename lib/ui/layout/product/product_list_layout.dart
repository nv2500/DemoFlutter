
import 'package:flutter/material.dart';
import 'package:flutter_app/business_logic/view_models/products_viewmodel.dart';
import 'package:flutter_app/ui/layout/product/product_row_base_widget.dart';
import 'package:flutter_app/ui/layout/product/product_row_choosing_widget.dart';

import 'product_row_checkout_widget.dart';

typedef S GenericTypeCreator<S>();

class ProductListLayout<T> extends StatefulWidget {

  final GenericTypeCreator<T> rowGenericType;

  const ProductListLayout({
    this.viewModel,
    this.rowGenericType,
    this.productList,
    this.footerWidget,
  }) :  assert(rowGenericType != null),
        assert(productList != null),
        assert(viewModel != null);

  final List<ProductViewPresentation> productList;
  final ProductsViewModel viewModel;

  final Widget footerWidget;

  @override
  State<StatefulWidget> createState() => _ProductListLayoutState();

}

class _ProductListLayoutState extends State<ProductListLayout> {

  bool hasFooter = false;

  Widget buildRow(ProductViewPresentation product, int index) {
    final ProductRowBaseWidget genType = widget.rowGenericType() as ProductRowBaseWidget;
    if (genType is ProductRowChoosingWidget) {
      // cast back to original data type
      //print('>>> BINGO!!!!! ');
      return ProductRowChoosingWidget(
        viewModel: widget.viewModel,
        selectedProduct: product,
        rowIndex: index,
      );
    } else if (genType is ProductRowCheckoutWidget) {
      return ProductRowCheckoutWidget(
        viewModel: widget.viewModel,
        selectedProduct: product,
        rowIndex: index,
      );
    } else {
      print('>>> GOOD LUCK NEXT TIME!!!!! ');
      // throw UnimplementedError();
      throw ArgumentError('Invalid generic type of ProductRowBaseWidget');
    }
  }

  @override
  void initState() {
    super.initState();

    print('>>> ProductListLayout->initState was called!!!');
    if (widget.footerWidget != null) {
      hasFooter = true;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print('>>> ProductListLayout->dispose was called!!!');
  }

  @override
  Widget build(BuildContext context) {
    //print('has footer: $hasFooter, ${widget.footerWidget == null}');
      return ListView.builder (
        // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          // TODO will fix bottom padding of ListView in case we don't have
          // floating button on screen
          padding: const EdgeInsets.only(left: 4, top: 4, right: 4, bottom: 64),
          itemCount: hasFooter ? (widget.productList.length + 1) : widget.productList.length,

          itemBuilder: (BuildContext _context, int index) {

            // Product product = productList.elementAt(index);
            // debugPrint('>>>build row at: $index, name: ${product.name}');
            if (index >= widget.productList.length && hasFooter) {
              return widget.footerWidget;
            }

            return buildRow(widget.productList.elementAt(index), index);
          }
      );
  }


}

