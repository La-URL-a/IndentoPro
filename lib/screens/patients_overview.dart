import 'package:flutter/material.dart';
import 'package:indentopro/models/add_userdata.dart';

class PatientsOverview extends StatefulWidget {
  @override
  _PatientsOverviewState createState() => _PatientsOverviewState();
}

class _PatientsOverviewState extends State<PatientsOverview> {
  TextEditingController _userController;
  TextEditingController _locationController;
  TextEditingController _ageController;
  TextEditingController _bmiController;
  TextEditingController _dataController;

  addData() async {
    String csvString =
        "${_userController.text},${_locationController.text},${_ageController.text},${_bmiController.text},${_dataController.text}";
    print(csvString);
    bool done = await addDataToCSV(csvString);
    SnackBar snackBar;
    if (!done) {
      snackBar = SnackBar(
        content: Text('Unable to write to file'),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      );
    } else {
      snackBar = SnackBar(
        content: Text('Data written to file'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _locationController = TextEditingController();
    _ageController = TextEditingController();
    _bmiController = TextEditingController();
    _dataController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _locationController.dispose();
    _ageController.dispose();
    _bmiController.dispose();
    _dataController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PatientIn hinzufügen'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _scaffoldKey,
          child: Column(
            children: [
              TextFormField(
                  controller: _userController,
                  decoration: InputDecoration(
                    labelText: 'User ID z.B. MM01011990',
                  ),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) return 'Pflichtfeld';
                  }),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Körperregion',
                ),
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Pflichtfeld';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Alter eintragen',
                ),
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Pflichtfeld';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _bmiController,
                decoration: InputDecoration(
                  labelText: 'BMI aktuell',
                ),
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Pflichtfeld';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _dataController,
                decoration: InputDecoration(
                  labelText: 'Messdaten',

                ),
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Pflichtfeld';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.maxFinite,
                child: RaisedButton.icon(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    addData();
                  },
                  icon: Icon(Icons.save),
                  label: Text('SAVE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
