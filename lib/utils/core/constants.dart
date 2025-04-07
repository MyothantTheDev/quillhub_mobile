class Constants {
  // ------- Url -------
  static const String baseURL = 'http://10.0.2.2:5000';
  static const String apiVersion = '$baseURL/api/v1';

  // Auth Url
  static const String loginURL = '$apiVersion/login';
  static const String registerURL = '$apiVersion/register';
  static const String logoutURL = '$apiVersion/logout';

  // User Url
  static const String userURL = '$apiVersion/user';

  // Post Url
  static const String postURL = '$apiVersion/post/all';
  static const String postdetailURL = '$apiVersion/post';
  static const String commentURL = '$apiVersion/comments';

  // ------ Status ------
  static const String serverError = 'Server error';
  static const String unauthorized = 'Unauthorized';
  static const String internalError = 'Something went wrong';
}