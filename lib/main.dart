import 'package:flutter/material.dart';
import 'package:users/config/init/navigation/navigator.dart';
import 'package:users/config/routes/page_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users Kash App',
      theme: ThemeData(),
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: '/homeview',
      onGenerateRoute: AllRoutes.instance.onGenerateRoute,
    );
  }
}