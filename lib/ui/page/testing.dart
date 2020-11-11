import 'package:flutter/material.dart';
import 'package:flutter_app/ui/data/app_options.dart';

class TestingScreen1 extends StatelessWidget {
  const TestingScreen1();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "DEMO 123",
        home: const TestingScreen2(
          title: "hello",
        ));
  }
}

class TestingScreen2 extends StatefulWidget {
  const TestingScreen2({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _TestingScreen2State createState() => _TestingScreen2State();
}

class _TestingScreen2State extends State<TestingScreen2> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Widget _buildMainBody(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // Use sort keys to make sure the cart button is always on the top.
    // This way, a11y users do not have to scroll through the entire list to
    // find the cart, and can easily get to the cart from anywhere on the page
    return Stack(
        children: [
          Container(
              width: deviceSize.width,
              height: 64,
              color: Colors.blueAccent),
          Text("data", style: TextStyle(color: Colors.white),),
        ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
          ),
          body: _buildMainBody(context),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: _incrementCounter,
          //   tooltip: 'Increment',
          //   child: Icon(Icons.add),
          // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
