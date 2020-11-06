
import 'package:flutter/material.dart';
import 'package:flutter_app/model/product.dart';

class ProductListSelectFavLayout extends StatefulWidget {
  const ProductListSelectFavLayout({
    @required this.productList,
    // this.listRowWidget,
    // @required this.listRowWidget,
  }) :  assert(productList != null);
  // assert (listRowWidget != null);

  final List<Product> productList;

  @override
  State<StatefulWidget> createState() => _ProductListSelectFavLayout(productList);

}

class _ProductListSelectFavLayout extends State<ProductListSelectFavLayout> {
  final List<Product> productList;

  _ProductListSelectFavLayout(this.productList) : assert(productList != null);

  Widget buildRow(Product product, int index) {
    // final alreadySaved = _productListSaved.contains(product);  // NEW
    return Card(
        child: ListTile(
          title: Text(
            product.nameTesting,
            // style: biggerFont,
          ),
          trailing: Icon(
            // alreadySaved ? Icons.favorite : Icons.favorite_border,
            // color: alreadySaved ? Colors.red : null,
              Icons.favorite_border,
          ),
          onTap: () {
            print('row $index tapped');
            setState(() {
            //   if (alreadySaved) {
            //     _productListSaved.remove(product);
            //   } else {
            //     _productListSaved.add(product);
            //   }
            });
          },
          // onTap: tapCallback.onTap,
        ));
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

