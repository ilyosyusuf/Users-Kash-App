import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:users/repositories/user_repository.dart';
import 'package:users/screens/bloc/home_event.dart';
import 'package:users/screens/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc(this.userRepository) : super(HomeLoadingState()) {
    initialFunction();
    on<refreshApiEvent>(
      refreshData
    );
  }

  initialFunction() {
    on<HomeEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        final users = await userRepository.getUsers();
        emit(HomeLoadedState(users!));
      },
    );
  }

  FutureOr refreshData(refreshApiEvent refreshEvent, Emitter emit) async {
    try {
      emit(HomeLoadingState());
      final users = await userRepository.getUsers();
      print("yield ishladi");
      emit(HomeLoadedState(users!));
    } catch (e) {
      emit(HomeErrorState());
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
