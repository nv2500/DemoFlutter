
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/product/product_row_select_fav_widget.dart';
import 'package:flutter_app/model/product.dart';

class ProductListLayout extends StatefulWidget {
  const ProductListLayout({
    @required this.productList,
  }) :  assert(productList != null);

  final List<Product> productList;

  @override
  State<StatefulWidget> createState() => _ProductListSelectFavLayout(productList);

}

class _ProductListSelectFavLayout extends State<ProductListLayout> {
  final List<Product> productList;

  _ProductListSelectFavLayout(this.productList) : assert(productList != null);

  Widget buildRow(Product product, int index) {
    Widget row = ProductRowSelectFavWidget(
      selectedProduct: product,
      index: index,
      tapCallback: () {
        print('>>> tap at row $index ');
        setState(() {
          // TODO leave this empty call to force invalidate UI
        });
      },
    );

    return row;
  }

  @override
  Widget build(BuildContext context) {
      return ListView.builder (
        // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(8),
          itemCount: productList.length,

          itemBuilder: (BuildContext _context, int index) {

            Product product = productList.elementAt(index);
            debugPrint('>>>build row at: $index, name: ${product.name}');

            // listRowWidget =  BaseProductListRowWidget(product: product,) as T;
            // listRowWidget.product = product;

            return buildRow(product, index);
          }
      );
  }


}

