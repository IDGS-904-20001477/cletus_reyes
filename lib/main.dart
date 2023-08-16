import 'package:cletus_reyes/provider/products_provider.dart';
import 'package:cletus_reyes/routes/app_routes.dart';
import 'package:cletus_reyes/themes/app_themes.dart';
import 'package:cletus_reyes/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        scaffoldMessengerKey: NotificationsService.messengerKey,
        onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
      ),
    );
  }
}
