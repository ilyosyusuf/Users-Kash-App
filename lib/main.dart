import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:users/config/init/navigation/navigator.dart';
import 'package:users/config/routes/page_routes.dart';
import 'package:users/models/usermodel/user_model.dart';
import 'package:users/repositories/user_repository.dart';
import 'package:users/screens/bloc/home_bloc.dart';
import 'package:users/screens/bloc/home_event.dart';
import 'package:users/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(UserModelAdapter());
  await HiveService.instance.openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => UserRepository())],
      child: BlocProvider(
        create: (context) {
          var data = RepositoryProvider.of<UserRepository>(context);
          return HomeBloc(data)..add(LoadApiEvent());
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Users Kash App',
          theme: ThemeData(useMaterial3: true),
          navigatorKey: NavigationService.instance.navigatorKey,
          initialRoute: '/homeview',
          onGenerateRoute: AllRoutes.instance.onGenerateRoute,
        ),
      ),
    );
  }
}
