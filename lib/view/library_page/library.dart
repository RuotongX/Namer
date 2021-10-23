import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  static const String routeName = '/Library';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => LibraryPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: new Text("Library",
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 25.0)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            child: ListTile(
              leading: Text('mouse',
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0)),
              title: Text('16:42:31 18/10/2021',
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 10.0)),
              trailing: Text('Non-dangerous',
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0)),
            ),
          ),
          Card(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            child: ListTile(
              leading: Text('knife',
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0)),
              title: Text('12:20:18 19/10/2021',
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 10.0)),
              trailing: Text('Dangerous',
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0)),
            ),
          ),
          Card(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            child: ListTile(
              leading: Text('tv',
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0)),
              title: Text('15:35:26 20/10/2021',
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 10.0)),
              trailing: Text('Non-dangerous',
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0)),
            ),
          ),
        ],
      ),
    );
  }
}
