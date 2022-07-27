import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:users/core/boxes/boxes.dart';
import 'package:users/core/constants/color_const.dart';
import 'package:users/models/hivemodel/hive_model.dart';
import 'package:users/repositories/user_repository.dart';
import 'package:users/screens/bloc/home_bloc.dart';
import 'package:users/screens/bloc/home_event.dart';
import 'package:users/screens/bloc/home_state.dart';
import 'package:users/services/hive_service.dart';
import 'package:users/widgets/listtile_widget.dart';

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
          // return ValueListenableBuilder<Box<HiveModel>>(
          //         valueListenable: Boxes.instance.getHiveBox().listenable(),
          //         builder: (context, box, i) {
          //           final users =
          //               box.values.toList().cast<HiveModel>();
          //           return ListView.builder(
          //               itemCount: users.length,
          //               itemBuilder: (context, i) {
          //                 return Dismissible(
          //                   key: UniqueKey(),
          //                   onDismissed: (v) {
          //                     HiveService.instance
          //                         .deleteData(users[i]);
          //                   },
          //                   child: Text(users[i].name),
          //                 );
          //               });
          //         },
          //       );
          return ListView.builder(
            itemCount: state.props.length,
            itemBuilder: (context, i){
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (v){},
              child: ListTileWidget(itemColor: ColorConst.kSecondaryColor, leadingColor: ColorConst.kPrimaryColor, userId: state.props[i].id.toString(), userName: state.props[i].name, userEmail: state.props[i].email));
          });
        } else{
          return Container();
        }
      },
      ),
  );
}