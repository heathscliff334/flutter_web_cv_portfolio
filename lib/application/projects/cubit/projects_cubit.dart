import 'package:bloc/bloc.dart';
import 'package:flutter_web/domain/projects/projects_response.dart';
import 'package:flutter_web/infrastructure/projects/projects_repository.dart';
import 'package:meta/meta.dart';

part 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit() : super(ProjectsInitial());
  ProjectsRepository _projectsRepository = ProjectsRepository();

  void getProjects() async {
    emit(ProjectsLoading());
    try {
      print("try");
      final _data = await _projectsRepository.getProjectsList();
      _data.fold(
        (l) => emit(ProjectsError(l)),
        (r) => emit(ProjectsGetSuccess(r)),
      );
    } catch (e) {
      print("catch");
      emit(ProjectsError(e.toString()));
    }
  }
}
