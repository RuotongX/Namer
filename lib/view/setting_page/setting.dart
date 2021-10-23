import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  static const String routeName = '/Setting';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => SettingPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: new Text("Setting",
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
              title: Text('Login',
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0)),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Card(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            child: ListTile(
              title: Text('Language',
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0)),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Card(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            child: ListTile(
              title: Text('Pronunciation',
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0)),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Card(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            child: ListTile(
              title: Text('Object type',
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0)),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ],
      ),
    );
  }
}
