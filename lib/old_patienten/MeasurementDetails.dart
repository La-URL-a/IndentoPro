import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indentopro/widgets/overview_sidemenu.dart';

class Measurement extends StatefulWidget {
  @override
  MeasurementState createState() {
    return new MeasurementState();
  }
}

class MeasurementState extends State<Measurement> {
  TextEditingController myController;

  @override
  void initState() {
    super.initState();
    myController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: null,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Messungsdaten Übersicht"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
          },
          tooltip: "Kopierte Messung hier einfügen",
        ),
      ],
      rows: messungen
          .map(
            (messungen) => DataRow(
              cells: [
                DataCell(
                  Text(messungen.measurementFeedback),
                  showEditIcon: true,
                  placeholder: false,
                  onTap: () async {
                    var clipboardData = await Clipboard.getData('text/plain');
                    print(clipboardData.text);
                  },
                ),
              ],
            ),
          )
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Messungsdaten Übersicht'), backgroundColor: Colors.teal),
      body: Container(
        child: bodyData(),
      ),
    );
  }
}

class Messung {
  String measurementFeedback;

  Messung({this.measurementFeedback});
}

var messungen = <Messung>[
  Messung(measurementFeedback: "Kopiere die Messdaten hierher")
];
