import 'package:quillhub/models/base.dart';
import 'package:quillhub/models/api_response.dart';

class User extends Model {
  int? id;
  String? name;
  String? image;
  String? email;
  String? token;


  User({
    this.id,
    this.name,
    this.image,
    this.email,
    this.token,
    this.error,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      image: json['user']['image'],
      email: json['user']['email'],
      token: json['user']['token'],
    );
  }

  factory User.errorCounter(ApiResponse response) {
    return User(
      error: response.message
    );
  }

  @override
  String? error;

}