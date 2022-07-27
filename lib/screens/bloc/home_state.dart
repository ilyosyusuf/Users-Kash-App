import 'package:equatable/equatable.dart';
import 'package:users/models/usermodel/user_model.dart';
import 'package:users/repositories/user_repository.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  // HomeLoadingState();
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<UserModel> users;

  HomeLoadedState(this.users);

  @override
  List<UserModel> get props => users;
}

class HomeErrorState extends HomeState {
    @override
  List<Object> get props => [];
}