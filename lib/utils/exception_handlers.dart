import 'package:dio/dio.dart';

class ExceptionHandlers {
  getErrorDetail(DioException error) async {
    String errorMessage = error.response.toString();

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = "Silahkan coba lagi nanti atau hubungi administrator";
        break;
      case DioExceptionType.connectionError:
        errorMessage = "Silahkan coba lagi nanti atau hubungi administrator";
        break;
      case DioExceptionType.badCertificate:
        errorMessage = "Silahkan coba lagi nanti atau hubungi administrator";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Silahkan coba lagi nanti atau hubungi administrator";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Silahkan coba lagi nanti atau hubungi administrator";
        break;
      case DioExceptionType.badResponse:
        if (error.response!.statusCode == 429) {
          errorMessage =
              "${"${"(${error.response!.statusCode}) ${error.response!.data['fault']['code']} " + error.response!.data['fault']['message']} - " + error.response!.data['fault']['description']}, Next Access Time: ${error.response!.data['fault']['nextAccessTime']}";
        } else if (error.response!.statusCode == 403) {
          if (error.response!.data is String) {
            errorMessage =
                "${error.response!.statusCode} - ${error.response!.statusMessage}";
          } else {
            errorMessage =
                "${error.response!.data['displayMessage'] ?? error.response!.statusMessage}";
          }
        } else {
          // inspectDebug(error.response!.data);
          if (error.response!.data != null) {
            if (error.response!.data is String) {
              errorMessage =
                  "${error.response!.statusCode} - ${error.response!.statusMessage}";
            } else {
              errorMessage =
                  "${error.response!.data['displayMessage'] ?? error.response!.statusMessage}";
            }
          } else {
            errorMessage =
                "${error.response!.statusCode} - ${error.response!.statusMessage}";
          }
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = "Silahkan coba lagi nanti atau hubungi administrator";
        break;
      case DioExceptionType.unknown:
        if (error.response == null) {
          errorMessage =
              "Tidak dapat terhubung ke server, silahkan cek koneksi internet anda dan coba lagi nanti";
        } else {
          errorMessage = error.message.toString();
        }
        break;
    }

    return errorMessage;
  }
}
