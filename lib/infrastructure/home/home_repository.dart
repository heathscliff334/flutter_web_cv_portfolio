import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web/domain/home/model/home_response.dart';

class HomeRepository {
  Dio _dio = new Dio();

  Future<Either<String, HomeResponse>> getHomeList() async {
    Response _response;

    try {
      _response = await _dio
          .get('https://laurenscodes.space:5000/api/online_cv/home/1');

      HomeResponse _getHome = HomeResponse.fromJson(_response.data);
      return right(_getHome);
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
