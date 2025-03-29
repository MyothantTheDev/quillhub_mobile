class Constants {
  // ------- Url -------
  static const String baseURL = 'http://127.0.0.1:8000/api';
  static const String loginURL = '$baseURL/login';
  static const String registerURL = '$baseURL/register';
  static const String logoutURL = '$baseURL/logout';
  static const String userURL = '$baseURL/user';
  static const String postURL = '$baseURL/posts';
  static const String commentURL = '$baseURL/comments';

  // ------ Status ------
  static const String serverError = 'Server error';
  static const String unauthorized = 'Unauthorized';
  static const String internalError = 'Something went wrong';
}