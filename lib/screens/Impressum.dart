import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:indentopro/widgets/overview_sidemenu.dart';

class ImpressumSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Impressum & Support',
        home: Scaffold(
            drawer: Navigation(),
            appBar: AppBar(
              title: Text('Impressum'),
              backgroundColor: Colors.teal,
            ),
            body: Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/images/Hintergrund_hochkant.jpg'),
                            fit: BoxFit.cover)),
                    child: Linkify(
                      onOpen: _onOpen,
                      textAlign: TextAlign.center,
                      text:
                          "\n\n\n\n\n\n\n\n\n\n\n\n\n\nImpressum:\nhttps://www.fasciaresearch.com/impressum",
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                    )))));
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
