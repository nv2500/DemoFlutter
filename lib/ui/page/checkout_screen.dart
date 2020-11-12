
import 'package:flutter/material.dart';
import 'package:flutter_app/business_logic/view_models/products_viewmodel.dart';
import 'package:flutter_app/ui/data/colors.dart';
import 'package:flutter_app/ui/layout/letter_spacing.dart';
import 'package:flutter_app/ui/layout/product/product_list_layout.dart';
import 'package:flutter_app/ui/layout/product/product_row_checkout_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/main.dart';

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
            productList: model.productsInCart,
            rowGenericType: () => ProductRowCheckoutWidget(),
            footerWidget: _footerCartSummary(context, model),
          ),
        ));
  }

  Widget _footerCartSummary(BuildContext context, ProductsViewModel model) {
    final smallAmountStyle =
        Theme.of(context).textTheme.bodyText2.copyWith(color: DemoColors.gray);
    final largeAmountStyle = Theme.of(context).textTheme.headline4.copyWith(
        letterSpacing: letterSpacingOrNone(0.04), color: DemoColors.gray);
    final formatter = NumberFormat.simpleCurrency(
      decimalDigits: 2,
      locale: Localizations.localeOf(context).toString(),
    );

    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 16, top: 30, end: 16, bottom: 30),
      child: Column(
        children: [
          MergeSemantics(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total:',
                  style: largeAmountStyle,
                ),
                Expanded(
                  child: Text(
                    formatter.format(model.totalCost),
                    style: largeAmountStyle,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          MergeSemantics(
            child: Row(
              children: [
                Text(
                  'Subtotal:',
                  style: smallAmountStyle,
                ),
                Expanded(
                  child: Text(
                    formatter.format(model.subtotalCost),
                    style: smallAmountStyle,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          MergeSemantics(
            child: Row(
              children: [
                Text(
                  'Delivery:',
                  style: smallAmountStyle,
                ),
                Expanded(
                  child: Text(
                    formatter.format(model.shippingCost),
                    style: smallAmountStyle,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          MergeSemantics(
            child: Row(
              children: [
                Text(
                  'Tax',
                  style: smallAmountStyle,
                ),
                Expanded(
                  child: Text(
                    formatter.format(model.tax),
                    style: smallAmountStyle,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          RaisedButton.icon(
            color: DemoColors.buttonColor,
            icon: const Icon(Icons.credit_card, size: 16,),
            label: Text(
              'Checkout',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: DemoColors.textColor),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onPressed: () {
              // pop out to home board page
              model.loadData();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  _buildMainScaffold(context);
  }

}