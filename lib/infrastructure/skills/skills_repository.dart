import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web/domain/skills/model/skills_response.dart';

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
    } on DioError catch (e) {
      // Error from Dio

      print("Status Code: ${e.response?.statusCode}");
      String errorMessage = e.response?.data;
      switch (e.type) {
        case DioErrorType.connectTimeout:
          break;
        case DioErrorType.sendTimeout:
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          errorMessage = e.response?.data["error"];
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          break;
      }
      return left(errorMessage);
    }
  }
}
