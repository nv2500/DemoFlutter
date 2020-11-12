
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/data/colors.dart';

import 'product_row_base_widget.dart';

// ignore: must_be_immutable
class ProductRowCheckoutWidget extends ProductRowBaseWidget {

  const ProductRowCheckoutWidget({
    viewModel,
    selectedProduct,
    rowIndex,
    // tapCallback,
  })  : super(
          viewModel: viewModel,
          selectedProductVP: selectedProduct,
          rowIndex: rowIndex,
          // tapCallback: null,
        );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // return Card(
    //   // elevation: 4.0,
    //   child:
    Widget newrow =
      Padding(
        padding: EdgeInsets.all(12.0),
        child: //Column(
          //children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle_outline_outlined, color: DemoColors.buttonColor,),
                  onPressed: () {
                    if (selectedProductVP.quantity > 0)
                      selectedProductVP.quantity -= 1;
                    // if (selectedProduct.quantity == 0)
                    // MyDemoApp.sSavedProductList.remove(selectedProduct);
                    // tapCallback(selectedProduct.id);

                    // viewModel.selectedProductList.elementAt(rowIndex).quantity = selectedProductVP.quantity;
                    viewModel.updateQuantity();

                  },
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: DemoColors.billColor(selectedProductVP.id),
                  child: Text(
                    selectedProductVP.name.characters.first,
                    style: textTheme.headline6.copyWith(
                      // fontSize: 16,
                      color: DemoColors.textColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Text('Quantity: ${selectedProductVP.quantity} x',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.subtitle1.copyWith(
                                fontSize: 16,
                                color: DemoColors.gray,
                              ),
                            ),
                            Expanded(child: SizedBox(),),
                            Text('\$'+ selectedProductVP.price.toString(),
                              style: textTheme.subtitle1.copyWith(
                                fontSize: 16,
                                color: DemoColors.gray,
                              ),
                            )
                          ],
                        ),
                        Text(selectedProductVP.name,
                          style: textTheme.bodyText2.copyWith(
                            // fontSize: 20,
                            color: DemoColors.gray,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                /*Opacity(
                  opacity: selectedProduct.isFeatured ? 1.0 : 0.0,
                  child: Icon(Icons.star_border),
                ),
                Visibility(
                  visible: selectedProduct.isFeatured,
                  child: Icon(Icons.star_border),
                ),
                if (selectedProduct.isFeatured) Icon(Icons.star_border),
                if(selectedProduct.isFeatured) Text('Showing') else Text('Not showing')*/
                // Text('x \$${selectedProduct.price}'),
                // Text('\$'+ selectedProduct.price.toString(),
                //   style: textTheme.subtitle1.copyWith(
                //     fontSize: 16,
                //     color: DemoColors.gray,
                //   ),
                // )
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 8.0),
            //   child: Text(
            //     'This is an article, trying to explain custom callbacks inside custom widgets.'
            //         ' Let\'s just add some more text just to make it a bulky description.',
            //     textAlign: TextAlign.justify,
            //     style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),
            //   ),
            // ),
          // ],
        // ),
      // ),
    );

    Widget x = Column(
      children: [
        newrow,
        const Divider(
          height: 2,
          indent: 16,
          endIndent: 16,
          color: DemoColors.dividerColor,
        ),
      ],
    );

    return x;
  }

}