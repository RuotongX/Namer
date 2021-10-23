import 'package:namer/view/home_page/home.dart';
import 'package:namer/view/library_page/library.dart';
import 'package:flutter/material.dart';
import 'package:namer/view/setting_page/setting.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('this is routeL ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomePage.route();
      case '/Library':
        return LibraryPage.route();
      case '/Setting':
        return SettingPage.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
      ),
    );
  }
}
