import 'package:indentopro/helpers/database_helpers.dart';
import 'package:flutter/material.dart';

import 'package:indentopro/widgets/overview_sidemenu.dart';

class PatientenSingle extends StatelessWidget {
  get db => null;

    
  @override

  Widget build(BuildContext context){
    var container = Container(
     // Center(
     //   child:
    //     Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/Hintergrund_hochkant.jpg'),
            fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton( // first FAB to perform decrement 
                  child: Text('Read'),
                  onPressed: () {
                    _read();
                  },),
                  RaisedButton( // second FAB to perform increment
                  child: Text('Save'),
                  onPressed: () {
                    _save();
                  },),
                ],
              )







 /*         child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
               //// mainAxisAlignment: MainAxisAlignment.center,
                child: RaisedButton(
                  child: Text('Read'),
                  onPressed: () {
                    _read();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Save'),
                  onPressed: () {
                    _save();
                  },
                ),
              ),
            ],
  */        );
    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        title: Text('Einzelansicht'),
        backgroundColor: Colors.teal,        
      ),
      body: container,
       // ),
          //),

          
          floatingActionButton: FloatingActionButton(
          onPressed: () {
            
          },
          child: Icon(Icons.add)));
  }

        _read() async {
        DatabaseHelper helper = DatabaseHelper.instance;
        int rowId = 2;
        Word word = await helper.queryWord(rowId);
        if (word == null) {
          print('read row $rowId: empty');
        } else {
          print('read row $rowId: ${word.word} ${word.frequency}');
          db.query(tableWords);
        }
      }
      _save() async {
        Word word = Word();
        word.word = 'Saved';
        word.frequency = 15;
        DatabaseHelper helper = DatabaseHelper.instance;
        int id = await helper.insert(word);
        print('inserted row: $id');
      }
}