import 'dart:developer' as devlog;
import 'dart:io';

// import 'layout/backdrop.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app/page/splash.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/product.dart';
import 'model/products_repository.dart';


void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String loginRoute = '/myapp/login';
  static const String homeRoute = '/myapp';

  @override
  Widget build(BuildContext context) {
    Widget temp() {
      return Container(
        decoration: BoxDecoration(color: Colors.lightBlue[900]),
        child: DemoApp(),
        // child: Center(
        //   child: Text(
        //     'Hello World',
        //     textDirection: TextDirection.ltr,
        //     style: TextStyle(
        //       fontSize: 32,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      );
    }

    Widget temp2() {
      return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: DemoApp(),
      );
    }

    Widget temp3() {
      return MaterialApp(
        // title: 'Welcome to Flutter',
        debugShowCheckedModeBanner: false,
        // initialRoute: loginRoute,
        home: DemoApp(),
      );
    }

    return temp3();
  }
}

class DemoApp extends StatefulWidget {
  const DemoApp({
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

    return _DemoAppState();
  }
}

class _DemoAppState extends State<DemoApp> {

  // /// hello
  // final List<WordPair> _suggestions = <WordPair>[];            // NEW
  List<Product> _productListSuggestions = ProductsRepository.loadProducts(Category.all);
  final TextStyle _biggerFont = const TextStyle(fontSize: 18); // NEW

  final _productListSaved = Set<Product>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          final tiles = _productListSaved.map(
            (Product product) {
              return ListTile(
                title: Text(
                  product.name,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        }, // ...to here.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Text('hehe he');
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildListViewWidget(),
    );

    // return Directionality(
    //   textDirection: TextDirection.ltr,
    //   child: _buildListViewWidget(),
    // );
  }

  Widget _buildListViewWidget() {
    return ListView.builder (
        // physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        itemCount: _productListSuggestions.length,
        // padding: EdgeInsets.zero,
        // The itemBuilder callback is called once per suggested
        // word pairing, and places each suggestion into a ListTile
        // row. For even rows, the function adds a ListTile row for
        // the word pairing. For odd rows, the function adds a
        // Divider widget to visually separate the entries. Note that
        // the divider may be difficult to see on smaller devices.
        itemBuilder: (BuildContext _context, int index) {
          // Add a one-pixel-high divider widget before each row
          // in the ListView.
          // if (i.isOdd) {
          //   return Divider(
          //     height: 0,
          //     thickness: 0,
          //     color: Colors.transparent,
          //   );
          // }

          // // The syntax "i ~/ 2" divides i by 2 and returns an
          // // integer result.
          // // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // // This calculates the actual number of word pairings
          // // in the ListView,minus the divider widgets.
          // final int index = i ~/ 2;
          // // If you've reached the end of the available word
          // // pairings...
          // if (index >= _suggestions.length) {
          //   // ...then generate 10 more and add them to the
          //   // suggestions list.
          //   _suggestions.addAll(generateWordPairs().take(10));
          // }
          Product product = _productListSuggestions.elementAt(index);
          debugPrint('>>>build row at: $index, name: $product');
          return _buildRow(product, index);
        }
    );
  }

  Widget _buildRow(Product product, int index) {
    final alreadySaved = _productListSaved.contains(product);  // NEW

    return Card(
        child: ListTile(
          title: Text(
            product.name,
            style: _biggerFont,
            textDirection: TextDirection.ltr, // this sentence must have
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
          onTap: () {
            print('row $index tapped');
            setState(() {
              if (alreadySaved) {
                _productListSaved.remove(product);
              } else {
                _productListSaved.add(product);
              }
            });
          },
    ));
  }
}