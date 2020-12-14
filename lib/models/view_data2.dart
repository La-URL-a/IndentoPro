import 'package:flutter/material.dart';
import 'package:indentopro/models/read_data2.dart';

class ViewDataScreen extends StatelessWidget {
  DataRow buildDataRow(List<String> data) {
    print("from buildDataRow");
    print(data);
    return DataRow(
      cells: data
          .map<DataCell>(
            (cell) => DataCell(
              Text(cell),
            ),
          )
          .toList(),
    );
  }

  buildDataColumns() {
    List columns = <DataColumn>[
      DataColumn(
        label: Text(
          'User ID',
        ),
      ),
      DataColumn(
        label: Text(
          'Körperregion',
        ),
      ),
      DataColumn(
        label: Text(
          'Alter',
        ),
      ),
      DataColumn(
        label: Text(
          'Aktueller BMI',
        ),
      ),
      DataColumn(
        label: Text(
          'Messdaten',
        ),
      ),
    ];
    print("columns");
    print(columns.length);
    return columns;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Angelegte Daten"),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<List<String>>>(
        future: readDataFromCSV(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          print(snapshot.data.length);
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(rows: <DataRow>[
              for (int i = 1; i < snapshot.data.length; i++)
                buildDataRow(snapshot.data[i]),
            ], columns: buildDataColumns()),
          );
        },
      ),
    );
  }
}
