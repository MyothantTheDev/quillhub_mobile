import 'dart:convert';

import 'package:quillhub/models/api_response.dart';
import 'package:quillhub/models/article.dart';
import 'package:quillhub/services/api/api_service.dart';
import 'package:quillhub/utils/core/constants.dart';

class ArticleService {
  late ApiService _apiService;

  ArticleService() {
    _apiService = ApiService();
  }

  Future<List<Article>> getAllArticle(int page) async {
    List<Article> allArticles = [];
    try {
      final url = '${Constants.postURL}/$page';
      final response = await _apiService.getRequest(
          url,
          headers: {'Accept': 'application/json'}
      );

      if (response.data != null && response.data is List<dynamic>) {
        for(final item in response.data as List<dynamic>) {
          try {
            Map<String, dynamic> raw_article = jsonDecode(item);
            allArticles.add(Article.fromJson(raw_article));
          } catch (e) {
            print('Error parsing article: $e');
          }
        }
      }
    } catch (e) {
      print('Error fetching article: $e');
      allArticles.add(Article.errorCounter(ApiResponse()..message = e.toString()));
    }
    return allArticles;
  }

  Future<Article> getDetailArticle(String id) async {
    try {
      final response = await _apiService.getRequest(
          '${Constants.postURL}/$id',
          headers: {'Accept': 'application/json'}
      );
      if (response.status != 200) {
        return Article.errorCounter(response);
      }
      return Article.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      print('Error fetching article: $e');
      return Article.errorCounter(ApiResponse()..message = e.toString());
    }
  }

}