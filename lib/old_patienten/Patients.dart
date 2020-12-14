import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:indentopro/old_patienten/data_import.dart';
import 'package:indentopro/old_patienten/newpatient.dart';
import 'package:indentopro/old_patienten/patientsNEW.dart';
//import 'package:IndentoPro/screens/patientinnennnneuuuu.dart';
import 'package:indentopro/widgets/overview_sidemenu.dart';
// ignore: implementation_imports
import 'package:flutter/src/rendering/box.dart';

class MyUserList extends StatefulWidget {
  @override
  _MyUserListState createState() => _MyUserListState();
}

class _MyUserListState extends State<MyUserList> {
  final List<UserData> _userData = [];

  // ignore: unused_element
  void _addNewUserData(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = UserData(
      date: chosenDate,
      id: DateTime.now().toString(),
      averageimprintdeepness: null,
      averagestiffness: null,
      increaseofforcepersecond: null,
      location: null,
      stiffnesssecondindentation: null,
      stiffnestfirstindentation: null,
      variationcoefficient: null,
      time: null,
    );

    setState(() {
      _userData.add(newTx);
    });
  }

  // ignore: unused_element
  void _startaddNewUserData(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewUserData(_addNewUserData),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteUserData(String id) {
    setState(() {
      _userData.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        title: Text('PatientInnen Übersicht'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startaddNewUserData(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            UserDataList(_userData, _deleteUserData),
            Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('lib/images/Hintergrund_hochkant.jpg'),
                        fit: BoxFit.cover)),
                child: SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SearchBar(
                          // ignore: missing_return
                          onSearch: (String text) {},
                          // ignore: missing_return
                          onItemFound: (item, int index) {},
                        )))),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startaddNewUserData(context),
      ),
    );
  }
}
