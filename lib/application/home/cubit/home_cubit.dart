import 'package:bloc/bloc.dart';
import 'package:flutter_web/domain/home/model/home_response.dart';
import 'package:flutter_web/infrastructure/home/home_repository.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  HomeRepository _homeRepository = new HomeRepository();

  void getHomes() async {
    emit(HomeLoading());
    try {
      print("Try");
      final _data = await _homeRepository.getHomeList();
      _data.fold(
        (l) => emit(HomeError(l)),
        (r) => emit(HomeSuccess(r)),
      );
    } catch (e) {
      print("Catch");
      emit(HomeError(e.toString()));
    }
  }
}
