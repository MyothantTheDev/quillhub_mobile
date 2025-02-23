import 'dart:convert';

import 'package:quillhub/services/api_response.dart';
import 'package:quillhub/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:quillhub/utils/error_handling.dart';

class ApiService{

  Future<ApiResponse> postRequest(String url, Map<String, String> headers, Map<String, String> body) async {

    try {
      final response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: body
      );
      return _handleResponse(response);
    } catch(e) {
      return _handleException();
    }

  }

  Future<ApiResponse> getRequest(String url, Map<String, String> headers) async {

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers
      );
      return _handleResponse(response);
    } catch(e) {
      return _handleException();
    }

  }


  ApiResponse _handleResponse(http.Response response) {
    ApiResponse apiResponse = ApiResponse();
    if (response.statusCode == 200) {
      apiResponse.data = jsonDecode(response.body);
    } else {
      apiResponse.error = ErrorHandling.handleHttpError(response);
    }
    return apiResponse;
  }

  ApiResponse _handleException() {
    ApiResponse apiResponse = ApiResponse();
    apiResponse.error = Constants.serverError;
    return apiResponse;
  }

}