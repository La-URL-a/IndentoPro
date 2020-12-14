import 'package:flutter/material.dart';
import 'package:indentopro/main.dart';
import 'package:indentopro/screens/Data_safety_AGBs.dart';
import 'package:indentopro/screens/Impressum.dart';
import 'package:indentopro/screens/support.dart';
import 'package:indentopro/screens/patients_addorview.dart';
import 'package:indentopro/screens/BLE.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'Navigation',
            style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          decoration: BoxDecoration(
              color: Colors.blue[100],
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('lib/images/medicalbachground.jpg'))),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            'Startseite',
            style: TextStyle(fontSize: 16),
          ),
          onTap: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()))
          },
        ),
        ListTile(
          leading: Icon(Icons.group),
          title: Text(
            'PatientInnen',
            style: TextStyle(fontSize: 16),
          ),
          onTap: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen())),
          },
        ),
        ListTile(
          leading: Icon(Icons.bluetooth),
          title: Text(
            'Bluetooth',
            style: TextStyle(fontSize: 16),
          ),
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BluetoothLowEnergy()))
          },
        ),
        ListTile(
          leading: Icon(Icons.extension),
          title: Text(
            'Impressum',
            style: TextStyle(fontSize: 16),
          ),
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ImpressumSupport()))
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_support),
          title: Text(
            'Support',
            style: TextStyle(fontSize: 16),
          ),
          onTap: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Support()))
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text(
            'Datenschutz & AGBs',
            style: TextStyle(fontSize: 16),
          ),
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DatenSchutzAgbs()))
          },
        ),
      ],
    ));
  }
}
