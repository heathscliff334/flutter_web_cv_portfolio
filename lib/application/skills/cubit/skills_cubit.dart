import 'package:bloc/bloc.dart';
import 'package:flutter_web/domain/skills/model/skills_response.dart';
import 'package:flutter_web/infrastructure/skills/skills_repository.dart';
import 'package:meta/meta.dart';

part 'skills_state.dart';

class SkillsCubit extends Cubit<SkillsState> {
  SkillsCubit() : super(SkillsInitial());
  SkillsRepository _skillsRepository = new SkillsRepository();

  void getSkills() async {
    emit(SkillsLoading());
    try {
      print("Try");
      final _data = await _skillsRepository.getSkillList();
      _data.fold(
        (l) => emit(SkillsError(l)),
        (r) => emit(SkillsGetSuccess(r)),
      );
    } catch (e) {
      print("Catch");
      emit(SkillsError(e.toString()));
    }
  }
}
