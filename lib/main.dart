import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/config/init/navigation/navigator.dart';
import 'package:users/config/routes/page_routes.dart';
import 'package:users/repositories/user_repository.dart';
import 'package:users/screens/view/home_view.dart';

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
      // home:
      home: MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (context)=> UserRepository())
      ], child: HomeView())
      // initialRoute: '/homeview',
      // onGenerateRoute: AllRoutes.instance.onGenerateRoute,
    );
  }
}