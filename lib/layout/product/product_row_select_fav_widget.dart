
import 'package:flutter/material.dart';
import 'package:flutter_app/data/colors.dart';

import '../../main.dart';
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

    Widget newrow = Card (
      child: Padding (
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // product image ---------------------------------------------------
            CircleAvatar(
              backgroundColor: DemoColors.billColor(selectedProduct.id),
              child: Text(
                selectedProduct.name.characters.first,
                style: TextStyle(color: Colors.black),
              ),
            ),

            // name and price --------------------------------------------------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(selectedProduct.name),
                    Text(''+ selectedProduct.price.toString())
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
                OutlineButton.icon(
                  // highlightedBorderColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  borderSide: BorderSide(color: DemoColors.buttonColor),
                  icon: const Icon(Icons.add, size: 16,),
                  //padding: const EdgeInsets.all(3.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
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
                  Text('${selectedProduct.quantity}'),
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
      )
    );

    // Widget row = Card(
    //     child: ListTile(
    //       title: Text(
    //         selectedProduct.nameTesting,
    //         // style: biggerFont,
    //       ),
    //       trailing: Icon(
    //         alreadySaved ? Icons.favorite : Icons.favorite_border,
    //         color: alreadySaved ? Colors.red : null,
    //       ),
    //       onTap: () {
    //         // update saving state of selected product
    //         if (alreadySaved) {
    //           MyDemoApp.sSavedProductList.remove(selectedProduct);
    //         } else {
    //           MyDemoApp.sSavedProductList.add(selectedProduct);
    //         }
    //         // TODO call this to force invalidate UI
    //         tapCallback(selectedProduct.id);
    //       },
    //     ));
    return newrow;
  }

}