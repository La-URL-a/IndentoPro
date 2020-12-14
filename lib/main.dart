import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:indentopro/widgets/overview_sidemenu.dart';
import 'package:flutter_blue/flutter_blue.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndentoPro',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navigation(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('IndentoPro'),
          backgroundColor: Colors.teal,
        ),
        body: Center(
            child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('lib/images/Hintergrund_hochkant.jpg'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    'Herzlich\nWillkommen\nin der\nIndentoPro\nApp!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87, fontSize: 40),
                  ),
                ))));
  }
}
