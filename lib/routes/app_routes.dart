import 'package:cletus_reyes/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../screens/screen_export.dart';

class AppRoutes {
  static List<Map<String, dynamic>> menu = [
    {
      'router': '/products',
      'name': 'Productos',
      'icon': const Icon(Icons.list)
    },
    {'router': '/', 'name': 'Cerrar Sesión', 'icon': const Icon(Icons.close)},
  ];

  static Map<String, Widget Function(BuildContext context)> routes = {
    '/': (BuildContext context) => const LoginScreen(),
    '/products': (BuildContext context) => const ProductsScreen(),
    //'/DescriptionScreen': (BuildContext context) => const DescriptionScreen(),
  };

  static onGenerateRoute(settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }

  static String initialRoute = '/';
}
