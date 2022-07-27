import 'package:bloc/bloc.dart';
import 'package:users/repositories/user_repository.dart';
import 'package:users/screens/bloc/home_event.dart';
import 'package:users/screens/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{

  final UserRepository userRepository;

  HomeBloc(this.userRepository):super(HomeLoadingState()){
    on<HomeEvent>((event, emit) async{
      final users = await userRepository.getUsers();
      emit(HomeLoadedState(users));
    });
  }
}