import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web/domain/projects/projects_response.dart';
import 'package:flutter_web/utils/exception_handlers.dart';

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
    } on DioException catch (e) {
      return left(await ExceptionHandlers().getErrorDetail(e));
    }
  }
}
