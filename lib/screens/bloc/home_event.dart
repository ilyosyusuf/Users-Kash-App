abstract class HomeEvent {
  const HomeEvent();
}

class LoadApiEvent extends HomeEvent {}

class RefreshApiEvent extends HomeEvent {}

class DeleteDataEvent extends HomeEvent {}
