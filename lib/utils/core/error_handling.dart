import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quillhub/utils/core/constants.dart';

class ErrorHandling {
  static String handleHttpError(http.Response response) {
    switch(response.statusCode){
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        return errors[errors.keys.elementAt(0)][0];
      case 403:
        return jsonDecode(response.body)['errors'];
      default:
        return Constants.internalError;
    }
  }
}