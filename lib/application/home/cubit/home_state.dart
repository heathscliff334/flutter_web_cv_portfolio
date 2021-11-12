part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String errorMessage;
  HomeError(this.errorMessage);
}

class HomeSuccess extends HomeState {
  final HomeResponse getHomeList;
  HomeSuccess(this.getHomeList);
}
