import 'package:flutter/material.dart';
import 'table.dart';
class HomePage extends StatelessWidget{
  //const HomePage ({required Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Tables(),
      ),
    );
  }
} //HomePage

class Tables extends StatelessWidget{
  final tableslist = <TablesClass>[
    TablesClass(tableName: 'tableName1', description: 'description1'),
    TablesClass(tableName: 'tableName2', description: 'description2'),
    TablesClass(tableName: 'tableName3', description: 'description3'),
    TablesClass(tableName: 'tableName4', description: 'description4'),
    TablesClass(tableName: 'tableName5', description: 'description5'),
  ];
  @override



  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: tableslist.length,
            itemBuilder: (context, i){
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.8)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: Container (
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(Icons.account_circle,
                          color: Theme.of(context).textTheme.headline6!.color),
                      decoration: BoxDecoration(
                          border: Border(right: BorderSide(width: 1, color: Colors.white24))
                      ),
                    ),
                    title: Text(tableslist[i].tableName,
                      style: TextStyle(color: Theme.of(context).textTheme.headline6!.color,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down,
                        color: Theme.of(context).textTheme.headline6!.color),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}