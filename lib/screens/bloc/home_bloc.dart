import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:users/repositories/user_repository.dart';
import 'package:users/screens/bloc/home_event.dart';
import 'package:users/screens/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc(this.userRepository) : super(HomeLoadingState()) {
    on<loadApiEvent>(loadData);
    on<refreshApiEvent>(refreshData);
  }

  FutureOr loadData(loadApiEvent refreshEvent, Emitter emit) async {
    try {
      emit(HomeLoadingState());
      final users = await userRepository.getUsers();
      print("initial");
      emit(HomeLoadedState(users!));
    } catch (e) {
      emit(HomeErrorState(message: "Error at refreshing user data"));
    }
  }

  FutureOr refreshData(refreshApiEvent refreshEvent, Emitter emit) async {
    try {
      emit(HomeLoadingState());
      final users = await userRepository.getUsers();
      print("yield ishladi");
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
