part of 'skills_cubit.dart';

@immutable
abstract class SkillsState {}

class SkillsInitial extends SkillsState {}

class SkillsLoading extends SkillsState {}

class SkillsError extends SkillsState {
  final String errorMessage;
  SkillsError(this.errorMessage);
}

class SkillsGetSuccess extends SkillsState {
  final SkillsResponse getSkillsList;
  SkillsGetSuccess(this.getSkillsList);
}
