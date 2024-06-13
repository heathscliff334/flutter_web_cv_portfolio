import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web/domain/skills/model/skills_response.dart';
import 'package:flutter_web/utils/exception_handlers.dart';

class SkillsRepository {
  Dio _dio = new Dio();
  Future<Either<String, SkillsResponse>> getSkillList() async {
    Response _response;

    try {
      _response = await _dio
          .get('https://laurenscodes.space:5000/api/online_cv/skills');

      // SkillsResponse _getSkill = SkillsResponse.fromJson(_response.data);
      print("${_response.statusCode}");
      SkillsResponse _getSkill = SkillsResponse.fromJson(_response.data);
      return right(_getSkill);
    } on DioException catch (e) {
      return left(await ExceptionHandlers().getErrorDetail(e));
    }
  }
}
