import 'package:flutter/material.dart';
import 'package:flutter_app/model/product.dart';

// ignore: must_be_immutable
class BaseProductListRowWidget extends StatefulWidget {
  BaseProductListRowWidget({Product product});

  Product product;
  int index;

  final TextStyle biggerFont =
      const TextStyle(fontSize: 16, color: Colors.black); // NEW

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
