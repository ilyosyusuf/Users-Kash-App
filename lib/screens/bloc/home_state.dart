import 'package:equatable/equatable.dart';
import 'package:users/models/usermodel/user_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
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
  final String message;
  HomeErrorState({required this.message});
  @override
  List<Object> get props => [];
}
