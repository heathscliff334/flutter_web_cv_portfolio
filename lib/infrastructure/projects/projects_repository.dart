import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web/domain/projects/projects_response.dart';

class ProjectsRepository {
  Dio _dio = Dio();
  Future<Either<String, ProjectsResponse>> getProjectsList() async {
    Response _response;
    try {
      _response = await _dio
          .get("https://laurenscodes.space:5000/api/online_cv/projects");
      // print(_response);
      ProjectsResponse _getProject = ProjectsResponse.fromJson(_response.data);
      return right(_getProject);
    } on DioError catch (e) {
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
