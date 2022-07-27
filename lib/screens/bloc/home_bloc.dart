import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:users/repositories/user_repository.dart';
import 'package:users/screens/bloc/home_event.dart';
import 'package:users/screens/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc(this.userRepository) : super(HomeLoadingState()) {
    initialFunction();
    on<RefreshApiEvent>(
      refreshData
    );
  }

  initialFunction() {
    on<LoadApiEvent>(
      (event, emit) async {
            try {
      emit(HomeLoadingState());
      final users = await userRepository.getUsers();
      print("initial");
      emit(HomeLoadedState(users!));
    } catch (e) {
      emit(HomeErrorState(message: "Error at loading user data"));
    }
      },
    );
  }

  FutureOr refreshData(RefreshApiEvent refreshEvent, Emitter emit) async {
    try {
      emit(HomeLoadingState());
      final users = await userRepository.getUsers();
      print("refresh");
      emit(HomeLoadedState(users!));
    } catch (e) {
      emit(HomeErrorState(message: "Error at refreshing user data"));
    }
  }

  //     @override
  // Stream<HomeState> mapEventToState(HomeEvent event) async* {
  //   if (event is refreshApiEvent) {
  //     yield HomeLoadingState();
  //     final users = await userRepository.getUsers();
  //     print("yield ishladi");
  //     yield HomeLoadedState(users!);
  //     print("yield ishladi");
  //     try {} catch (e) {
  //       print("yield xato");
  //     }
  // }
  // }

}
