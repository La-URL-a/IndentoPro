import 'package:flutter/material.dart';
import 'package:indentopro/widgets/overview_sidemenu.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navigation(),
        appBar: AppBar(
          title: Text('Technischer Support'),
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
                    'Technischer Support:\ntbd\n\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                ))));
  }
}
