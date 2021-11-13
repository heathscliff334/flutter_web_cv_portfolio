part of 'projects_cubit.dart';

@immutable
abstract class ProjectsState {}

class ProjectsInitial extends ProjectsState {}

class ProjectsLoading extends ProjectsState {}

class ProjectsError extends ProjectsState {
  final String errorMessage;
  ProjectsError(this.errorMessage);
}

class ProjectsGetSuccess extends ProjectsState {
  final ProjectsResponse getProjectsList;
  ProjectsGetSuccess(this.getProjectsList);
}
