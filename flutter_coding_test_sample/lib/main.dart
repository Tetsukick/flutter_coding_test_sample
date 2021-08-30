import 'package:flutter/material.dart';
import 'package:flutter_coding_test_sample/components/carousel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  var _isScaledUp = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Carousel(),
            flutterAnimationBox()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isScaledUp) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
          _isScaledUp = !_isScaledUp;
        },
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget flutterAnimationBox() {
    return Center(
      child: DecoratedBoxTransition(
        decoration: _animationController
          .drive(
            CurveTween(curve: Curves.fastOutSlowIn),
          )
          .drive(
            DecorationTween(
              begin: const FlutterLogoDecoration(
                style: FlutterLogoStyle.horizontal,
              ),
              end: const FlutterLogoDecoration(
                style: FlutterLogoStyle.stacked,
              ),
            ),
          ),
        child: const SizedBox(
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
