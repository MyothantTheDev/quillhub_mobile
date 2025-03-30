class Constants {
  // ------- Url -------
  static const String baseURL = 'http://127.0.0.1:5000';
  static const String apiVersion = '$baseURL/api/v1';
  static const String loginURL = '$apiVersion/login';
  static const String registerURL = '$apiVersion/register';
  static const String logoutURL = '$apiVersion/logout';
  static const String userURL = '$apiVersion/user';
  static const String postURL = '$apiVersion/posts';
  static const String commentURL = '$apiVersion/comments';

  // ------ Status ------
  static const String serverError = 'Server error';
  static const String unauthorized = 'Unauthorized';
  static const String internalError = 'Something went wrong';
}