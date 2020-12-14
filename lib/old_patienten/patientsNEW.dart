import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:indentopro/old_patienten/data_import.dart';

class UserDataList extends StatelessWidget {
  final List<UserData> userdata;
  final Function deleteTx;

  UserDataList(this.userdata, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: userdata.isEmpty
          ? Column(
              children: <Widget>[
                Text('No Users available'),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${userdata[index].id}'),
                        ),
                      ),
                    ),
                    title: Text(
                      userdata[index].location,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(userdata[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(userdata[index].id),
                    ),
                  ),
                );
              },
              itemCount: userdata.length,
            ),
    );
  }
}
