import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:users/core/base/base_view.dart';
import 'package:users/core/boxes/boxes.dart';
import 'package:users/core/constants/color_const.dart';
import 'package:users/models/usermodel/user_model.dart';
import 'package:users/repositories/user_repository.dart';
import 'package:users/screens/bloc/home_bloc.dart';
import 'package:users/screens/bloc/home_event.dart';
import 'package:users/screens/bloc/home_state.dart';
import 'package:users/services/hive_service.dart';
import 'package:users/widgets/listtile_widget.dart';
import 'package:users/widgets/shimmer_list_view_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          var data = RepositoryProvider.of<UserRepository>(context);
          return HomeBloc(data)..add(loadApiEvent());
        },
        child: scaffoldMethod(context));
  }

  Scaffold scaffoldMethod(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConst.kSecondaryColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/kashapp.png'),
            ),
          )
        ],
        title: const Text("Users"),
      ),
      body: BaseView(
        viewModel: HomeView,
        OnPageBuilder: (context, widget) {
          return SafeArea(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, i) {
                      return ShimmerListTileWidget();
                    },
                  );
                }
                if (state is HomeErrorState) {
                  return Center(child: Text(state.message));
                } else if (state is HomeLoadedState) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
                      homeBloc.add(refreshApiEvent());
                    },
                    child: ValueListenableBuilder<Box<UserModel>>(
                      valueListenable: Boxes.instance.getUserBox().listenable(),
                      builder: (context, box, i) {
                        final users = box.values.toList().cast<UserModel>();
                        return ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, i) {
                            return Dismissible(
                              direction: DismissDirection.endToStart,
                              key: UniqueKey(),
                              background: Container(
                                  margin: const EdgeInsets.all(20),
                                  color: ColorConst.kRedColor),
                              onDismissed: (v) {
                                HiveService.instance.deleteData(users[i]);
                              },
                              child: ListTileWidget(
                                  itemColor: ColorConst.kSecondaryColor,
                                  leadingColor: ColorConst.kPrimaryColor,
                                  userId: users[i].id.toString(),
                                  userName: users[i].name,
                                  userEmail: users[i].email),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return throw Exception("Error with states");
                }
              },
            ),
          );
        },
      ),
    );
  }
}
