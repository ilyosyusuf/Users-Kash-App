import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/repositories/user_repository.dart';
import 'package:users/screens/bloc/home_bloc.dart';
import 'package:users/screens/bloc/home_event.dart';
import 'package:users/screens/bloc/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context){
      var data = RepositoryProvider.of<UserRepository>(context);
      return HomeBloc(data)..add(loadApiEvent());
    },
    child: scaffoldMethod(context)
    );
  }

  Scaffold scaffoldMethod(BuildContext context) => Scaffold(
    
  );
}