import 'package:quillhub/models/api_response.dart';
import 'package:quillhub/utils/core/constants.dart';
import 'package:dio/dio.dart';

class ApiService{

  late Dio http;

  ApiService() {
    http = Dio(BaseOptions(
        connectTimeout: const Duration(milliseconds: 5 * 6000),
        receiveTimeout: const Duration(milliseconds: 5 * 6000)
      )
    );
  }

  Future<ApiResponse> postRequest(String url, Map<String, String> headers, Map<String, String> body) async {

    try {
      final response = await http.post(
          url,
          options: Options(
            headers: headers
          ),
          data: body
      );
      return _handleResponse(response);
    }
    catch(e) {
      return _handleException();
    }

  }

  Future<ApiResponse> getRequest(String url, {Map<String, String>? headers}) async {

    try {
      final response = await http.get(
        url,
        options: Options(headers: headers)
      );
      return _handleResponse(response);
    } on DioException catch(e) {
      if (e.response != null) {
        print('                       DIO ERROR                      ');
        print('----------------------------------------------------------------------');
        print('Dio Exception: ${e.response!.data}');
        print('Dio Error Message: ${e.response!.headers}');
        print('Dio Error Message: ${e.response!.requestOptions}');
        print('----------------------------------------------------------------------');
      }
      print('                       BASE HTTP CODE ERROR                      ');
      print('----------------------------------------------------------------------');
      print('BASE HTTP RESPONSE: ${e}');
      print('----------------------------------------------------------------------');
      return _handleException(e as Exception?);
    }
  }


  ApiResponse _handleResponse(dynamic response) {

    return ApiResponse.fromJson(response.data);
  }

  ApiResponse _handleException([Exception? e]) {
    ApiResponse apiResponse = ApiResponse();
    apiResponse.status = 400;
    apiResponse.message = Constants.serverError;

    if (e != null) {
      apiResponse.message = e.toString();
    }

    return apiResponse;
  }

}