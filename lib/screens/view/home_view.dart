import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/core/base/base_view.dart';
import 'package:users/core/constants/color_const.dart';
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
                  HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
                  return RefreshIndicator(
                    onRefresh: () async {
                      homeBloc.add(RefreshApiEvent());
                    },
                    child: ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, i) {
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          key: UniqueKey(),
                          background: Container(
                              margin: const EdgeInsets.all(20),
                              color: ColorConst.kRedColor),
                          onDismissed: (v) {
                            HiveService.instance.deleteData(state.users[i]);
                            homeBloc.add(DeleteDataEvent());
                          },
                          child: ListTileWidget(
                              itemColor: ColorConst.kSecondaryColor,
                              leadingColor: ColorConst.kPrimaryColor,
                              userId: state.users[i].id.toString(),
                              userName: state.users[i].name,
                              userEmail: state.users[i].email),
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
