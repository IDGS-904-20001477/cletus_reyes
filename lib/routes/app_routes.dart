import 'package:flutter/material.dart';
import '../screens/screen_export.dart';

class AppRoutes{
  static List<Map<String, dynamic>> menu = [
    {
      'router': '/',
      'name': 'Productos',
      'icon': const Icon(Icons.list)
    },
  ];

  static Map<String, Widget Function(BuildContext context)> routes = {
        '/': (BuildContext context) => const HomeScreen(),
        '/DescriptionScreen': (BuildContext context) => const DescriptionScreen(),
  };

  static onGenerateRoute(settings){
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }

  static String initialRoute = '/';

}
