
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/data/colors.dart';

import '../../../main.dart';
import 'product_row_base_widget.dart';

// ignore: must_be_immutable
class ProductRowSelectFavWidget extends ProductRowBaseWidget {

  const ProductRowSelectFavWidget({
    selectedProduct,
    rowIndex,
    tapCallback,
  })  : super(
          selectedProduct: selectedProduct,
          rowIndex: rowIndex,
          tapCallback: tapCallback,
        );

  @override
  Widget build(BuildContext context) {
    // final alreadySaved = MyDemoApp.sSavedProductList.contains(selectedProduct);  // NEW

    print('>>> quantity=${selectedProduct.quantity}');

    final textTheme = Theme.of(context).textTheme;

    // Widget newrow = Card (
    //   child: Padding (
    Widget newrow = Padding (
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            // product image ---------------------------------------------------
            CircleAvatar(
              radius: 24,
              backgroundColor: DemoColors.billColor(selectedProduct.id),
              child: Text(
                selectedProduct.name.characters.first,
                style: TextStyle(color: DemoColors.textColor),
              ),
            ),

            // name and price --------------------------------------------------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(selectedProduct.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyText1.copyWith(
                        fontSize: 16,
                        color: DemoColors.gray,
                      ),
                    ),
                    Text('\$'+ selectedProduct.price.toString(),
                      style: textTheme.bodyText2.copyWith(
                        // fontSize: 20,
                        color: DemoColors.gray,
                      ),
                    )
                  ],
                ),
              ),
            ),

            // quantity section ------------------------------------------------
            if (selectedProduct.quantity == 0)
              // Container(
              //     // color: Colors.red,
              //     width: 90,
              //     height: 40,
              //     child:
                /*OutlineButton.icon(
                  // highlightedBorderColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // borderSide: BorderSide(color: DemoColors.buttonColor),
                  icon: const Icon(Icons.add, size: 16,),
                  //padding: const EdgeInsets.all(3.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('Add'),
                  // child: Text('Add to cart'),
                  // style: TextButton.styleFrom(
                  //     backgroundColor: DemoColors.buttonColor,
                  //     // backgroundColor: DemoColors.billColor(3),
                  //     primary: Colors.black,
                  //     padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  // ),
                  onPressed: () {
                    // update saving state of selected product
                    selectedProduct.quantity += 1;
                    MyDemoApp.sSavedProductList.add(selectedProduct);
                    // TODO call this to force invalidate UI
                    tapCallback(selectedProduct.id);
                  },
              // )
            )*/
            RaisedButton.icon(
              color: DemoColors.buttonColor,
              icon: const Icon(Icons.add, size: 16,),
              label: Text('Add',
                style: textTheme.bodyText2.copyWith(
                  // fontSize: 20,
                  color: DemoColors.textColor,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () {
                // update saving state of selected product
                selectedProduct.quantity += 1;
                MyDemoApp.sSavedProductList.add(selectedProduct);
                // TODO call this to force invalidate UI
                tapCallback(selectedProduct.id);
              },
            )
            else Row( // (-) qty. (+)
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle_outline_outlined, color: DemoColors.buttonColor,),
                  onPressed: () {
                    selectedProduct.quantity -= 1;
                    if (selectedProduct.quantity == 0)
                      MyDemoApp.sSavedProductList.remove(selectedProduct);
                    tapCallback(selectedProduct.id);
                  },
                ),
                //Expanded(
                //  child:
                  Text('${selectedProduct.quantity}',
                    style: textTheme.bodyText1.copyWith(
                      fontSize: 20,
                      color: DemoColors.gray,
                    ),
                  ),
                //),
                IconButton(
                  icon: Icon(Icons.add_circle_outline_outlined, color: DemoColors.buttonColor,),
                  onPressed: () {
                    selectedProduct.quantity += 1;
                    tapCallback(selectedProduct.id);
                  },
                ),
              ],
            )
          ],
        ),
      // )
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

    // return newrow;

    return x;
  }

}