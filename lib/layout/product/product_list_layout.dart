
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/product/product_row_base_widget.dart';
import 'package:flutter_app/layout/product/product_row_select_fav_widget.dart';
import 'package:flutter_app/model/product.dart';

import 'product_row_selected_widget.dart';

typedef S ItemCreator<S>();

class ProductListLayout<T> extends StatefulWidget {

  final ItemCreator<T> rowGenericType;

  const ProductListLayout({
    @required this.rowGenericType,
    @required this.productList,
  }) :  assert(rowGenericType != null),
        assert(productList != null);

  final List<Product> productList;

  @override
  State<StatefulWidget> createState() => _ProductListLayoutState();
}

class _ProductListLayoutState extends State<ProductListLayout> {

  Widget buildRow(Product product, int index) {
    ProductRowBaseWidget row;
    if ((widget.rowGenericType() as ProductRowBaseWidget) is ProductRowSelectFavWidget) {
      // cast back to original data type
      //print('>>> BINGO!!!!! ');
      row = new ProductRowSelectFavWidget();
    } else if ((widget.rowGenericType() as ProductRowBaseWidget) is ProductRowSelectedWidget) {
      row = new ProductRowSelectedWidget();
    } else {
      print('>>> GOOD LUCK NEXT TIME!!!!! ');
    }
    // ProductRowBaseWidget row = new ProductRowSelectFavWidget();
    row.selectedProduct = product;
    row.rowIndex = index;
    row.tapCallback = (int tappedIndex) {
      print('>>> tap at row $index + ??? tappedIndex=$tappedIndex');
      setState(() {
        // TODO leave this empty call to force invalidate UI for item changed purpose
      });
    };

    return row;
  }

  @override
  void initState() {
    super.initState();

    print('>>> ProductListLayout->initState was called!!!');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print('>>> ProductListLayout->dispose was called!!!');
  }

  @override
  Widget build(BuildContext context) {
      return ListView.builder (
        // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(8),
          itemCount: widget.productList.length,

          itemBuilder: (BuildContext _context, int index) {

            // Product product = productList.elementAt(index);
            // debugPrint('>>>build row at: $index, name: ${product.name}');

            return buildRow(widget.productList.elementAt(index), index);
          }
      );
  }


}

