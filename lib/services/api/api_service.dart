import 'dart:convert';

import 'package:quillhub/models/api_response.dart';
import 'package:quillhub/utils/core/constants.dart';
import 'package:http/http.dart' as http;

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

  Future<ApiResponse> getRequest(String url, {Map<String, String>? headers}) async {

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers
      );
      return _handleResponse(response);
    } catch(e) {
      return _handleException(e as Exception?);
    }

  }


  ApiResponse _handleResponse(http.Response response) {

    return ApiResponse.fromJson(jsonDecode(response.body));
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