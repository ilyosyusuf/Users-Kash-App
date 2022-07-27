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
    body: BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        
      },
      builder: (context, state){
        if(state is HomeLoadingState){
          return Center(child: CircularProgressIndicator.adaptive(),);
        } if (state is HomeErrorState) {
          return Text("xato");
        } else if(state is HomeLoadedState) {
          return ListView.builder(
            itemCount: state.props.length,
            itemBuilder: (context, i){
            return Text("${state.props[0].name == state.props[0].name}");
          });
        } else{
          return Container();
        }
      },
      ),
  );
}