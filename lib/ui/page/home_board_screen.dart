import 'dart:developer' as devlog;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/business_logic/view_models/products_viewmodel.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/ui/data/colors.dart';
import 'package:flutter_app/ui/layout/product/product_list_layout.dart';
import 'package:flutter_app/ui/layout/product/product_row_choosing_widget.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();

    Provider.of<ProductsViewModel>(context, listen: false).loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _pushCheckoutScreen() {
    print('HomeBoardScreen->_pushCheckoutScreen');
    Navigator.of(context).pushNamed(MyDemoApp.checkoutRoute);
  }

  Scaffold _buildMainScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        // actions: [
        //   IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        // ],
        // backgroundColor: Colors.lightBlue[900],
      ),
      //body: _buildListViewWidget(),
      body: _buildMainPageBody(context),
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

  Widget _buildMainPageBody(BuildContext context) {
    // final deviceSize = MediaQuery.of(context).size;
    return Consumer<ProductsViewModel>(
      builder: (context, model, child) => Stack(
          children: <Widget>[
            ProductListLayout<ProductRowChoosingWidget> (// << product list--------
              viewModel: model,
              rowGenericType: ()=> ProductRowChoosingWidget(),
              productList: model.productList,
            ),
            //child,
            _bottomCartWidget(model),// << shopping cart icon for going to checkout screen
          ],
        ),
      //child: SomeExpensiveWidget(), // <= Build the expensive widget here.
    );
  }

  Widget _bottomCartWidget(ProductsViewModel model) => Row(
    children: [
      Expanded(child: SizedBox(),),// empty space
      Align( // shopping cart region
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: ()=> {
            print('Tapped!'),
            _pushCheckoutScreen()
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
                  SizedBox(width: 8,),
                  Text(_calculate(model), style: Theme.of(context).textTheme.subtitle2.copyWith(color: DemoColors.textColor)),
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );

  String _calculate(ProductsViewModel viewModel) {
    double totalPrice = 0;
    for (ProductViewPresentation product in viewModel?.productList) {
      if (product.quantity > 0) {
        totalPrice += product.quantity * product.price;
      }
    }
    return '\$$totalPrice';
  }

  @override
  Widget build(BuildContext context) {
    // model.loadData();
    // print('HomeBoardScreen->build, model=$model');
    // if (model == null) {
    //   model = serviceLocator<ProductsViewModel>();
    // }
    // var x = ChangeNotifierProvider.value(
    //   key: Key("12"),
    //     value: model,
    //     child:  _buildMainScaffold(context),
    // );
    // return x;
          // model.loadData();
    return _buildMainScaffold(context);

  }

}