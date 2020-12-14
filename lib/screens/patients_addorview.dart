import 'package:flutter/material.dart';
import 'package:indentopro/models/view_data2.dart';
import 'package:indentopro/screens/patients_overview.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PatientInnen'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientsOverview()));
              },
              child: Text('PatientIn hinzufügen'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewDataScreen()));
              },
              child: Text('Bestehende PatientInnen'),
            ),
          ],
        ),
      ),
    );
  }
}
