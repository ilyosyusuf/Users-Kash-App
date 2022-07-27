import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadApiEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
  
}

class RefreshApiEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
  
}