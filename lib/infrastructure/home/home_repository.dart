import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web/domain/home/model/home_response.dart';
import 'package:flutter_web/utils/exception_handlers.dart';

class HomeRepository {
  Dio _dio = new Dio();

  Future<Either<String, HomeResponse>> getHomeList() async {
    Response _response;

    try {
      _response = await _dio
          .get('https://laurenscodes.space:5000/api/online_cv/home/1');

      HomeResponse _getHome = HomeResponse.fromJson(_response.data);
      return right(_getHome);
    } on DioException catch (e) {
      return left(await ExceptionHandlers().getErrorDetail(e));
    }
  }
}
