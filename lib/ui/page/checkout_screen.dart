
import 'package:flutter/material.dart';
import 'package:flutter_app/business_logic/view_models/products_viewmodel.dart';
import 'package:flutter_app/ui/layout/product/product_list_layout.dart';
import 'package:flutter_app/ui/layout/product/product_row_checkout_widget.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen();

  @override
  State<StatefulWidget> createState() => _CheckoutScreenState();

}

class _CheckoutScreenState extends State<CheckoutScreen> {

  @override
  void initState() {
    super.initState();

    Provider.of<ProductsViewModel>(context, listen: false).loadSelectedProducts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Scaffold _buildMainScaffold(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.lightBlue[900],
        appBar: AppBar(
          title: Text('Checkout'),
        ),
        body: Consumer<ProductsViewModel>(
          builder: (context, model, child) => ProductListLayout(
            viewModel: model,
            productList: model.selectedProductList,
            rowGenericType: () => ProductRowCheckoutWidget(),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return  _buildMainScaffold(context);
  }

}