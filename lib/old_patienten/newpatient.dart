// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:indentopro/widgets/overview_sidemenu.dart';

class NeuerPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        title: Text('Neuer Eintrag'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
          child: Center(
              child: Text(
                  'Bitte tragen Sie hier den neuen Nutzernamen ein.\nBitte halten Sie sich an unsere Datenschutzregeln. Einen neuen Eintrag erstellen Sie über xxxx',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87, fontSize: 20)))),
    );
  }
}

class NewUserData extends StatefulWidget {
  final Function addTx;

  NewUserData(this.addTx);

  @override
  _NewUserDataState createState() => _NewUserDataState();
}

class _NewUserDataState extends State<NewUserData> {
  final _idController = TextEditingController();
  final _locationController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_idController.text.isEmpty) {
      return;
    }
    final enteredID = _idController.text;
    final enteredLocation = _locationController.text;

    if (enteredID.isEmpty || enteredLocation.isEmpty || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredID,
      enteredLocation,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'ID'),
              controller: _idController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Location'),
              controller: _locationController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Neuer Eintrag'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
