import 'dart:developer' as devlog;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/business_logic/view_models/home_board_screen_viewmodel.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/ui/data/colors.dart';
import 'package:flutter_app/ui/layout/product/product_list_layout.dart';
import 'package:flutter_app/ui/layout/product/product_row_select_fav_widget.dart';
import 'package:flutter_app/ui/layout/product/product_row_selected_widget.dart';
import 'package:provider/provider.dart';

import '../../business_logic/models/product.dart';
import '../model/products_repository.dart';

class HomeBoardScreen extends StatefulWidget {
  const HomeBoardScreen({
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

    return _HomeBoardScreenState();
  }

}

class _HomeBoardScreenState extends State<HomeBoardScreen> {

  // /// hello
  // final List<WordPair> _suggestions = <WordPair>[];            // NEW
  List<Product> _productListSuggestions = ProductsRepository.loadProducts(Category.all);
  final TextStyle _biggerFont = const TextStyle(fontSize: 16, color: Colors.black); // NEW

  HomeBoardScreenViewModel model;

  List<Product> _productListSaved = List<Product>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    MyDemoApp.sSavedProductList.clear();
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            // backgroundColor: Colors.lightBlue[900],
            appBar: AppBar(
              title: Text('Saved Products'),
            ),
            body: ProductListLayout (
              productList: MyDemoApp.sSavedProductList,
              rowGenericType: ()=> ProductRowSelectedWidget(),
            ),
          );
        },
      ),
    );
  }

  Scaffold _buildMainScaffold(BuildContext context, HomeBoardScreenViewModel model) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        // actions: [
        //   IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        // ],
        // backgroundColor: Colors.lightBlue[900],
      ),
      //body: _buildListViewWidget(),
      body: _buildMainBody(context),
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: () {
      //     _pushSaved();
      //   },
      //   tooltip: 'Saved Products',
      //   backgroundColor: DemoColors.buttonColor,
      //   child: new Icon(Icons.shopping_cart_outlined,),
      // ),
    );
  }

  Widget _buildMainBody(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        ProductListLayout<ProductRowSelectFavWidget> (
          rowGenericType: ()=> ProductRowSelectFavWidget(),
          productList: _productListSuggestions,
        ),
        Row(children: [
          Expanded(child: SizedBox(),),// empty space
          Align( // shopping cart region
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: ()=> {
                print('Tapped!'),
                _pushSaved()
              },
              child: Material(
                //animationDuration: const Duration(milliseconds: 10),

                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(12),
                    // bottomStart: Radius.circular(0),
                  ),
                ),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
                // ),

                elevation: 4,
                // shadowColor: Colors.red,
                // borderOnForeground: true,
                color: DemoColors.billColor(3),
                child: Padding(padding: const EdgeInsets.only(top: 12, left: 18, bottom: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.shopping_basket, color: DemoColors.textColor,),
                      Text(' \$360', style: Theme.of(context).textTheme.subtitle2.copyWith(color: DemoColors.textColor)),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeBoardScreenViewModel>(
      create: (context) => model,
      child: Consumer<HomeBoardScreenViewModel>(
        builder: (context, model, child) => _buildMainScaffold(context, model),
      ),
    );


    // return Directionality(
    //   textDirection: TextDirection.ltr,
    //   child: _buildListViewWidget(),
    // );
  }

}