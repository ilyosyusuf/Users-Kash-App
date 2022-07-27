import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:users/repositories/user_repository.dart';
import 'package:users/screens/bloc/home_event.dart';
import 'package:users/screens/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc(this.userRepository) : super(HomeLoadingState()) {
    on<LoadApiEvent>(loadData);
    on<RefreshApiEvent>(refreshData);
  }

  FutureOr loadData(LoadApiEvent refreshEvent, Emitter emit) async {
    try {
      emit(HomeLoadingState());
      final users = await userRepository.getUsers();
      print("initial");
      emit(HomeLoadedState(users!));
    } catch (e) {
      emit(HomeErrorState(message: "Error at loading user data"));
    }
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
}
