class ApiResponse {
  Object? data;
  String? message;
  int? status;

  ApiResponse({this.data, this.message, this.status});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {

    return ApiResponse(
      data: json['data'],
      message: json['message'],
      status: json['status']
    );
  }
}