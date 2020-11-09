import 'dart:developer' as devlog;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

import 'layout/product/product_list_layout.dart';
import 'layout/product/product_row_select_fav_widget.dart';
import 'layout/product/product_row_selected_widget.dart';
import 'model/product.dart';
import 'model/products_repository.dart';

class HomeAppBoard extends StatefulWidget {
  const HomeAppBoard({
    this.isTestMode = false,
  });

  final bool isTestMode;

  @override
  State<StatefulWidget> createState() {
    // ways to print debug log - S
    debugPrint('DemoApp - isTestMode: $isTestMode');

    stderr.writeln('stderr-print me');
    stdout.writeln('stdout-print me');

    devlog.log('dart:developer-print me');
    // ways to print debug log - E

    return _HomeAppBoardState();
  }
}

class _HomeAppBoardState extends State<HomeAppBoard> {

  // /// hello
  // final List<WordPair> _suggestions = <WordPair>[];            // NEW
  List<Product> _productListSuggestions = ProductsRepository.loadProducts(Category.all);
  final TextStyle _biggerFont = const TextStyle(fontSize: 16, color: Colors.black); // NEW

  List<Product> _productListSaved = List<Product>();

  // @override
  // void initState() {
  //   super.initState();
  // }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            // backgroundColor: Colors.lightBlue[900],
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ProductListLayout (
              productList: MyDemoApp.sSavedProductList,
              rowGenericType: ()=> new ProductRowSelectedWidget(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
        // backgroundColor: Colors.lightBlue[900],
      ),
      //body: _buildListViewWidget(),
      body: ProductListLayout<ProductRowSelectFavWidget> (
        rowGenericType: ()=> new ProductRowSelectFavWidget(),
        productList: _productListSuggestions,
      ),
    );

    // return Directionality(
    //   textDirection: TextDirection.ltr,
    //   child: _buildListViewWidget(),
    // );
  }

}