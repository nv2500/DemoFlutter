import 'package:flutter/material.dart';
import 'package:flutter_app/model/product.dart';

class BaseProductListLayout extends StatefulWidget {

  const BaseProductListLayout({
    @required this.productList,
    // this.listRowWidget,
    // @required this.listRowWidget,
  }) :  assert(productList != null);
        // assert (listRowWidget != null);

  final List<Product> productList;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

// class _BaseProductListLayoutState extends State<BaseProductListLayout> {
//   _BaseProductListLayoutState({
//     @required this.productList,
//     @required this.listRowWidget,
//     // @required this.listRowWidget,
//   }) :  assert (productList != null);
//         // assert (listRowWidget != null);
//
//   final List<Product> productList;
//   final Widget listRowWidget;
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return  _buildListViewWidget();
//   }
//
//   Widget _buildListViewWidget() {
//     return ListView.builder (
//       // physics: NeverScrollableScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         padding: const EdgeInsets.all(8),
//         itemCount: productList.length,
//         // padding: EdgeInsets.zero,
//         // The itemBuilder callback is called once per suggested
//         // word pairing, and places each suggestion into a ListTile
//         // row. For even rows, the function adds a ListTile row for
//         // the word pairing. For odd rows, the function adds a
//         // Divider widget to visually separate the entries. Note that
//         // the divider may be difficult to see on smaller devices.
//         itemBuilder: (BuildContext _context, int index) {
//           // Add a one-pixel-high divider widget before each row
//           // in the ListView.
//           // if (i.isOdd) {
//           //   return Divider(
//           //     height: 0,
//           //     thickness: 0,
//           //     color: Colors.transparent,
//           //   );
//           // }
//
//           // // The syntax "i ~/ 2" divides i by 2 and returns an
//           // // integer result.
//           // // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
//           // // This calculates the actual number of word pairings
//           // // in the ListView,minus the divider widgets.
//           // final int index = i ~/ 2;
//           // // If you've reached the end of the available word
//           // // pairings...
//           // if (index >= _suggestions.length) {
//           //   // ...then generate 10 more and add them to the
//           //   // suggestions list.
//           //   _suggestions.addAll(generateWordPairs().take(10));
//           // }
//           Product product = productList.elementAt(index);
//           debugPrint('>>>build row at: $index, name: ${product.name}');
//
//           // listRowWidget =  BaseProductListRowWidget(product: product,) as T;
//           // listRowWidget.product = product;
//
//           return buildRow(product, index);
//         }
//     );
//
//   }
//
//
//
//   // Widget _buildRow(Product product, int index) {
//   //   // final alreadySaved = _productListSaved.contains(product);  // NEW
//   //
//   //   return Card(
//   //       child: ListTile(
//   //         title: Text(
//   //           product.name,
//   //           style: _biggerFont,
//   //         ),
//   //         trailing: Icon(
//   //           // alreadySaved ? Icons.favorite : Icons.favorite_border,
//   //           // color: alreadySaved ? Colors.red : null,
//   //           Icons.favorite,
//   //           color: Colors.red,
//   //         ),
//   //         onTap: () {
//   //           print('row $index tapped');
//   //           setState(() {
//   //             /*if (alreadySaved) {
//   //               _productListSaved.remove(product);
//   //             } else {
//   //               _productListSaved.add(product);
//   //             }*/
//   //           });
//   //         },
//   //         // onTap: tapCallback.onTap,
//   //       ));
//   // }
// }

